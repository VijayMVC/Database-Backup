/****** Object:  Table [dbo].[syspolicy_conditions_internal]    Script Date: 5/15/2018 12:03:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[syspolicy_conditions_internal](
	[condition_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[date_created] [datetime] NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_by] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_by] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_modified] [datetime] NULL,
	[facet_id] [int] NULL,
	[expression] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_name_condition] [smallint] NULL,
	[obj_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_system] [bit] NOT NULL,
 CONSTRAINT [PK_syspolicy_conditions] PRIMARY KEY CLUSTERED 
(
	[condition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_syspolicy_conditions_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[syspolicy_conditions_internal] ADD  DEFAULT (getdate()) FOR [date_created]
ALTER TABLE [dbo].[syspolicy_conditions_internal] ADD  DEFAULT ('') FOR [description]
ALTER TABLE [dbo].[syspolicy_conditions_internal] ADD  DEFAULT (suser_sname()) FOR [created_by]
ALTER TABLE [dbo].[syspolicy_conditions_internal] ADD  DEFAULT ((0)) FOR [is_name_condition]
ALTER TABLE [dbo].[syspolicy_conditions_internal] ADD  DEFAULT ((0)) FOR [is_system]
ALTER TABLE [dbo].[syspolicy_conditions_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_conditions_internal_facet] FOREIGN KEY([facet_id])
REFERENCES [dbo].[syspolicy_management_facets] ([management_facet_id])
ALTER TABLE [dbo].[syspolicy_conditions_internal] CHECK CONSTRAINT [FK_syspolicy_conditions_internal_facet]
/****** Object:  Trigger [dbo].[syspolicy_after_update_condition_trigger]    Script Date: 5/15/2018 12:03:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_after_update_condition_trigger]
ON [msdb].[dbo].[syspolicy_conditions_internal]
AFTER UPDATE
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	-- This is to prevent indirect entrance of the trigger
	IF (TRIGGER_NESTLEVEL() > 1) 
		RETURN

    UPDATE msdb.dbo.syspolicy_conditions_internal
        SET modified_by = original_login(), date_modified = GETDATE()
        FROM inserted i 
        INNER JOIN msdb.dbo.syspolicy_conditions_internal c ON i.condition_id = c.condition_id

    -- update health state table by deleting all the records for 
    -- policies whose expression has been modified
    IF UPDATE(expression)
    BEGIN
        DELETE FROM dbo.syspolicy_system_health_state_internal 
            FROM dbo.syspolicy_system_health_state_internal phs
            INNER JOIN dbo.syspolicy_policies p ON phs.policy_id = p.policy_id
            INNER JOIN inserted i ON p.condition_id = i.condition_id
            INNER JOIN deleted d ON p.condition_id = d.condition_id
            WHERE d.expression != i.expression 
    END
END

/****** Object:  Trigger [dbo].[syspolicy_for_update_condition_trigger]    Script Date: 5/15/2018 12:03:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_for_update_condition_trigger]
ON [msdb].[dbo].[syspolicy_conditions_internal]
FOR UPDATE
AS
BEGIN
    -- do not allow expression to be changed to a script 
    -- if the policy is enabled
    IF UPDATE(expression)
    BEGIN
        DECLARE @row_count int

        SELECT @row_count = count(*) 
            FROM inserted i 
            INNER JOIN syspolicy_policies p ON (i.condition_id = p.condition_id OR p.root_condition_id = i.condition_id)
            WHERE    p.is_enabled != 0 AND
                    p.execution_mode != 4 AND
                    (1 = CONVERT(xml, i.expression).exist('//FunctionType/text()[.="ExecuteSql"]' ) OR
                    1 = CONVERT(xml, i.expression).exist('//FunctionType/text()[.="ExecuteWql"]' ) ) 
            OPTION (FORCE ORDER)

        SELECT @row_count = @row_count + count(*)
            FROM dbo.syspolicy_target_set_levels l 
            INNER JOIN dbo.syspolicy_target_sets s ON s.target_set_id = l.target_set_id
            INNER JOIN inserted i on i.condition_id = l.condition_id
            INNER JOIN syspolicy_object_sets_internal os ON s.object_set_id = os.object_set_id
            INNER JOIN syspolicy_policies p ON os.object_set_id = p.object_set_id
            WHERE    p.is_enabled != 0 AND
                    p.execution_mode != 4 AND
                    (1 = CONVERT(xml, i.expression).exist('//FunctionType/text()[.="ExecuteSql"]' ) OR
                    1 = CONVERT(xml, i.expression).exist('//FunctionType/text()[.="ExecuteWql"]' ) )
            OPTION (FORCE ORDER)

        IF (@row_count > 0)
        BEGIN
            RAISERROR(34017, -1, -1) 
            ROLLBACK TRANSACTION
        END
    END

	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	-- This is to prevent indirect entrance of the trigger
	IF (TRIGGER_NESTLEVEL() > 1) 
		RETURN
END

/****** Object:  Trigger [dbo].[syspolicy_insert_condition_trigger]    Script Date: 5/15/2018 12:03:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_insert_condition_trigger]
ON [msdb].[dbo].[syspolicy_conditions_internal]
AFTER INSERT
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

  UPDATE msdb.dbo.syspolicy_conditions_internal
  SET created_by = original_login()
  FROM inserted i INNER JOIN
       msdb.dbo.syspolicy_conditions_internal conditions
  ON i.condition_id = conditions.condition_id

END

GO
