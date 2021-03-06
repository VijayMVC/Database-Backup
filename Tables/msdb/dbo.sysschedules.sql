/****** Object:  Table [dbo].[sysschedules]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysschedules](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[schedule_uid] [uniqueidentifier] NOT NULL,
	[originating_server_id] [int] NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[owner_sid] [varbinary](85) NOT NULL,
	[enabled] [int] NOT NULL,
	[freq_type] [int] NOT NULL,
	[freq_interval] [int] NOT NULL,
	[freq_subday_type] [int] NOT NULL,
	[freq_subday_interval] [int] NOT NULL,
	[freq_relative_interval] [int] NOT NULL,
	[freq_recurrence_factor] [int] NOT NULL,
	[active_start_date] [int] NOT NULL,
	[active_end_date] [int] NOT NULL,
	[active_start_time] [int] NOT NULL,
	[active_end_time] [int] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_modified] [datetime] NOT NULL,
	[version_number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysschedules] ADD  DEFAULT (getdate()) FOR [date_created]
ALTER TABLE [dbo].[sysschedules] ADD  DEFAULT (getdate()) FOR [date_modified]
ALTER TABLE [dbo].[sysschedules] ADD  DEFAULT ((1)) FOR [version_number]
/****** Object:  Trigger [dbo].[trig_sysschedules_insert_update]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE TRIGGER [dbo].[trig_sysschedules_insert_update]
ON [dbo].[sysschedules]
FOR INSERT, UPDATE
AS
BEGIN
  SET NOCOUNT ON
  -- Disallow the insert or update if the originating_server_id isn't in sysoriginatingservers_view. 
  IF (EXISTS (SELECT *
            FROM inserted
           WHERE inserted.originating_server_id NOT IN 
                    (SELECT v.originating_server_id 
                     FROM sysoriginatingservers_view AS v)))
  BEGIN
   RAISERROR(14379, -1, -1, 'dbo.sysschedules')
   ROLLBACK TRANSACTION
    RETURN
  END
END

GO
