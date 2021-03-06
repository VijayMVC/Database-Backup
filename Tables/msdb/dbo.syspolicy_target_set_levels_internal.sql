/****** Object:  Table [dbo].[syspolicy_target_set_levels_internal]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[syspolicy_target_set_levels_internal](
	[target_set_level_id] [int] IDENTITY(1,1) NOT NULL,
	[target_set_id] [int] NOT NULL,
	[type_skeleton] [nvarchar](440) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[condition_id] [int] NULL,
	[level_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_syspolicy_target_set_levels_internal] PRIMARY KEY CLUSTERED 
(
	[target_set_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[syspolicy_target_set_levels_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_levels_conditions] FOREIGN KEY([condition_id])
REFERENCES [dbo].[syspolicy_conditions_internal] ([condition_id])
ALTER TABLE [dbo].[syspolicy_target_set_levels_internal] CHECK CONSTRAINT [FK_syspolicy_levels_conditions]
ALTER TABLE [dbo].[syspolicy_target_set_levels_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_levels_target_sets] FOREIGN KEY([target_set_id])
REFERENCES [dbo].[syspolicy_target_sets_internal] ([target_set_id])
ON DELETE CASCADE
ALTER TABLE [dbo].[syspolicy_target_set_levels_internal] CHECK CONSTRAINT [FK_syspolicy_levels_target_sets]
/****** Object:  Trigger [dbo].[syspolicy_insert_target_set_level_trigger]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_insert_target_set_level_trigger] 
    ON [dbo].[syspolicy_target_set_levels_internal]
FOR INSERT
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

    DECLARE @update_notifications INT
    DECLARE @update_ddl_trigger   INT

    SET @update_notifications = 0
    SET @update_ddl_trigger = 0

	DECLARE @level sysname
	SET @level = NULL
	
	-- Don't allow setting non-db levels for runtime policies
    SELECT TOP 1 @level = i.level_name
		FROM inserted i
		JOIN dbo.syspolicy_target_sets s ON (i.target_set_id = s.target_set_id)
		JOIN msdb.dbo.syspolicy_object_sets os ON s.object_set_id = os.object_set_id
		JOIN msdb.dbo.syspolicy_policies p ON (os.object_set_id = p.object_set_id)    
		WHERE 1 = dbo.syspolicy_fn_filter_complete (i.target_set_id) AND
			((p.execution_mode & 3) > 0 AND 0 = dbo.syspolicy_fn_eventing_filter (i.target_set_id))
	IF @level IS NOT NULL
    BEGIN
        RAISERROR(34016, -1, -1, @level) 
        ROLLBACK TRANSACTION
    END


    SELECT @update_notifications = SUM (p.execution_mode & 2), @update_ddl_trigger = SUM (p.execution_mode & 1)
        FROM inserted i
        JOIN dbo.syspolicy_target_sets s ON (i.target_set_id = s.target_set_id)
        JOIN msdb.dbo.syspolicy_object_sets_internal os ON (s.object_set_id = os.object_set_id)
        JOIN msdb.dbo.syspolicy_policies p ON (os.object_set_id = p.object_set_id)    
        WHERE 1 = dbo.syspolicy_fn_filter_complete (i.target_set_id) AND
            ((p.execution_mode & 3) > 0 AND p.is_enabled = 1 AND 1 = dbo.syspolicy_fn_eventing_filter (i.target_set_id))

    IF (@update_ddl_trigger > 0)
        EXEC sys.sp_syspolicy_update_ddl_trigger 

    IF    (@update_notifications > 0)    
        EXEC sys.sp_syspolicy_update_event_notification 
END

/****** Object:  Trigger [dbo].[syspolicy_update_target_set_level_trigger]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_update_target_set_level_trigger] ON [dbo].[syspolicy_target_set_levels_internal]
FOR UPDATE
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

    DECLARE @update_notifications INT
    DECLARE @update_ddl_trigger   INT

    SET @update_notifications = 0
    SET @update_ddl_trigger = 0

    IF UPDATE(condition_id)
    BEGIN
		DECLARE @level sysname
		SET @level = NULL
		
		-- Don't allow setting non-db levels for runtime policies
        SELECT TOP 1 @level = i.level_name
			FROM inserted i
			JOIN dbo.syspolicy_target_sets s ON (i.target_set_id = s.target_set_id)
			JOIN msdb.dbo.syspolicy_object_sets os ON s.object_set_id = os.object_set_id
			JOIN msdb.dbo.syspolicy_policies p ON (os.object_set_id = p.object_set_id)    
			WHERE 1 = dbo.syspolicy_fn_filter_complete (i.target_set_id) AND
				((p.execution_mode & 3) > 0 AND 0 = dbo.syspolicy_fn_eventing_filter (i.target_set_id))
		IF @level IS NOT NULL
        BEGIN
            RAISERROR(34016, -1, -1, @level) 
            ROLLBACK TRANSACTION
        END
    END

    SELECT @update_notifications = SUM (p.execution_mode & 2), @update_ddl_trigger = SUM (p.execution_mode & 1)
        FROM inserted i
        JOIN dbo.syspolicy_target_sets s ON (i.target_set_id = s.target_set_id)
        JOIN msdb.dbo.syspolicy_object_sets os ON s.object_set_id = os.object_set_id
        JOIN msdb.dbo.syspolicy_policies p ON (os.object_set_id = p.object_set_id)    
        WHERE 1 = dbo.syspolicy_fn_filter_complete (i.target_set_id) AND
            ((p.execution_mode & 3) > 0 AND p.is_enabled = 1 AND 1 = dbo.syspolicy_fn_eventing_filter (i.target_set_id))

    IF (@update_ddl_trigger > 0)
        EXEC sys.sp_syspolicy_update_ddl_trigger 

    IF    (@update_notifications > 0)    
        EXEC sys.sp_syspolicy_update_event_notification 

END

GO
