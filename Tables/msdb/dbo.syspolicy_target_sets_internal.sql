/****** Object:  Table [dbo].[syspolicy_target_sets_internal]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[syspolicy_target_sets_internal](
	[target_set_id] [int] IDENTITY(1,1) NOT NULL,
	[object_set_id] [int] NOT NULL,
	[type_skeleton] [nvarchar](440) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_syspolicy_target_sets] PRIMARY KEY CLUSTERED 
(
	[target_set_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [UX_syspolicy_levels]    Script Date: 5/15/2018 12:03:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_syspolicy_levels] ON [dbo].[syspolicy_target_sets_internal]
(
	[target_set_id] ASC,
	[type_skeleton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [UX_syspolicy_target_sets]    Script Date: 5/15/2018 12:03:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_syspolicy_target_sets] ON [dbo].[syspolicy_target_sets_internal]
(
	[object_set_id] ASC,
	[type_skeleton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[syspolicy_target_sets_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_target_sets_syspolicy_object_sets] FOREIGN KEY([object_set_id])
REFERENCES [dbo].[syspolicy_object_sets_internal] ([object_set_id])
ON DELETE CASCADE
ALTER TABLE [dbo].[syspolicy_target_sets_internal] CHECK CONSTRAINT [FK_syspolicy_target_sets_syspolicy_object_sets]
/****** Object:  Trigger [dbo].[syspolicy_delete_target_set_trigger]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_delete_target_set_trigger] ON [dbo].[syspolicy_target_sets_internal]
FOR DELETE
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

    -- If this is cascade delete, there will be no policies to join
    SELECT @update_notifications = SUM (p.execution_mode & 2), @update_ddl_trigger = SUM (p.execution_mode & 1)
        FROM deleted d
        JOIN msdb.dbo.syspolicy_object_sets_internal os ON d.object_set_id = os.object_set_id
        JOIN msdb.dbo.syspolicy_policies p ON (os.object_set_id = p.object_set_id)    
        WHERE ((p.execution_mode & 3) > 0 AND p.is_enabled = 1)

    IF (@update_ddl_trigger > 0)
        EXEC sys.sp_syspolicy_update_ddl_trigger 

    IF    (@update_notifications > 0)    
        EXEC sys.sp_syspolicy_update_event_notification 
END

/****** Object:  Trigger [dbo].[syspolicy_insert_target_set_trigger]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_insert_target_set_trigger] 
    ON [dbo].[syspolicy_target_sets_internal]
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

    -- Only need to check Server TargetSets, as they don't have levels
    SELECT @update_notifications = SUM (p.execution_mode & 2), @update_ddl_trigger = SUM (p.execution_mode & 1)
        FROM inserted i
        JOIN msdb.dbo.syspolicy_object_sets_internal os ON i.object_set_id = os.object_set_id
        JOIN msdb.dbo.syspolicy_policies p ON (os.object_set_id = p.object_set_id)    
        WHERE i.type = 'SERVER' AND ((p.execution_mode & 3) > 0 AND p.is_enabled = 1)

    IF (@update_ddl_trigger > 0)
        EXEC sys.sp_syspolicy_update_ddl_trigger 

    IF    (@update_notifications > 0)    
        EXEC sys.sp_syspolicy_update_event_notification 
END

GO
