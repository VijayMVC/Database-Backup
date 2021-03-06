/****** Object:  Table [dbo].[syscollector_collection_sets_internal]    Script Date: 5/15/2018 12:03:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[syscollector_collection_sets_internal](
	[collection_set_id] [int] IDENTITY(1,1) NOT NULL,
	[collection_set_uid] [uniqueidentifier] NOT NULL,
	[schedule_uid] [uniqueidentifier] NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name_id] [int] NULL,
	[target] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_running] [bit] NOT NULL,
	[proxy_id] [int] NULL,
	[is_system] [bit] NOT NULL,
	[collection_job_id] [uniqueidentifier] NULL,
	[upload_job_id] [uniqueidentifier] NULL,
	[collection_mode] [smallint] NOT NULL,
	[logging_level] [smallint] NOT NULL,
	[description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description_id] [int] NULL,
	[days_until_expiration] [smallint] NOT NULL,
	[dump_on_any_error] [bit] NOT NULL,
	[dump_on_codes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_syscollector_collection_sets_internal] PRIMARY KEY CLUSTERED 
(
	[collection_set_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_syscollector_collection_sets_internal_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[syscollector_collection_sets_internal] ADD  DEFAULT ((0)) FOR [is_running]
ALTER TABLE [dbo].[syscollector_collection_sets_internal] ADD  DEFAULT ((0)) FOR [collection_mode]
ALTER TABLE [dbo].[syscollector_collection_sets_internal] ADD  DEFAULT ((2)) FOR [logging_level]
ALTER TABLE [dbo].[syscollector_collection_sets_internal] ADD  DEFAULT ((0)) FOR [dump_on_any_error]
ALTER TABLE [dbo].[syscollector_collection_sets_internal]  WITH CHECK ADD  CONSTRAINT [FK_syscollector_collection_sets_collection_sysjobs] FOREIGN KEY([collection_job_id])
REFERENCES [dbo].[sysjobs] ([job_id])
ALTER TABLE [dbo].[syscollector_collection_sets_internal] CHECK CONSTRAINT [FK_syscollector_collection_sets_collection_sysjobs]
ALTER TABLE [dbo].[syscollector_collection_sets_internal]  WITH CHECK ADD  CONSTRAINT [FK_syscollector_collection_sets_internal_sysproxies] FOREIGN KEY([proxy_id])
REFERENCES [dbo].[sysproxies] ([proxy_id])
ALTER TABLE [dbo].[syscollector_collection_sets_internal] CHECK CONSTRAINT [FK_syscollector_collection_sets_internal_sysproxies]
ALTER TABLE [dbo].[syscollector_collection_sets_internal]  WITH CHECK ADD  CONSTRAINT [FK_syscollector_collection_sets_upload_sysjobs] FOREIGN KEY([upload_job_id])
REFERENCES [dbo].[sysjobs] ([job_id])
ALTER TABLE [dbo].[syscollector_collection_sets_internal] CHECK CONSTRAINT [FK_syscollector_collection_sets_upload_sysjobs]
/****** Object:  Trigger [dbo].[syscollector_collection_set_is_running_update_trigger]    Script Date: 5/15/2018 12:03:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syscollector_collection_set_is_running_update_trigger] on [dbo].[syscollector_collection_sets_internal]
WITH EXECUTE AS OWNER -- 'MS_DataCollectorInternalUser'
FOR UPDATE
AS
BEGIN
    DECLARE @collection_set_id INT
    DECLARE @is_running BIT
    DECLARE @old_is_running BIT
    DECLARE @collection_mode SMALLINT

    IF (NOT UPDATE (is_running))
       RETURN

    DECLARE @collector_enabled int
    SET @collector_enabled = CONVERT(int, (SELECT parameter_value FROM dbo.syscollector_config_store_internal
                            WHERE parameter_name = 'CollectorEnabled'))
    IF @collector_enabled = 0
    BEGIN
        -- flipping the is_running bit has no effect when the collector is disabled
        RAISERROR(14682, 10, -1) -- severity 10 emits a warning
    END
    ELSE
    BEGIN
        DECLARE inserted_cursor CURSOR LOCAL FOR 
            SELECT collection_set_id, is_running, collection_mode
            FROM inserted 

        OPEN inserted_cursor
        FETCH inserted_cursor INTO @collection_set_id, @is_running, @collection_mode
        
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            SELECT @old_is_running = is_running FROM deleted WHERE collection_set_id = @collection_set_id

            -- If there is a change in the state, handle accordingly
            IF (@old_is_running <> @is_running)
            BEGIN
                IF (@is_running = 0)
                BEGIN
                    EXEC dbo.sp_syscollector_stop_collection_set_jobs @collection_set_id = @collection_set_id
                END
                ELSE IF (@is_running = 1)
                BEGIN              
                    EXEC dbo.sp_syscollector_start_collection_set_jobs @collection_set_id = @collection_set_id
                END
            END

            FETCH inserted_cursor INTO @collection_set_id, @is_running, @collection_mode
        END    

        CLOSE inserted_cursor
        DEALLOCATE inserted_cursor
    END
END

GO
