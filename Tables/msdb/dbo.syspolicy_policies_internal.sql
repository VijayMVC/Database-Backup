/****** Object:  Table [dbo].[syspolicy_policies_internal]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[syspolicy_policies_internal](
	[policy_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[condition_id] [int] NOT NULL,
	[root_condition_id] [int] NULL,
	[date_created] [datetime] NOT NULL,
	[execution_mode] [int] NOT NULL,
	[policy_category_id] [int] NULL,
	[schedule_uid] [uniqueidentifier] NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[help_text] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[help_link] [nvarchar](2083) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[object_set_id] [int] NULL,
	[is_enabled] [bit] NOT NULL,
	[job_id] [uniqueidentifier] NULL,
	[created_by] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_by] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_modified] [datetime] NULL,
	[is_system] [bit] NOT NULL,
 CONSTRAINT [PK_syspolicy_policies] PRIMARY KEY CLUSTERED 
(
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_syspolicy_policies_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT (getdate()) FOR [date_created]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT ((0)) FOR [execution_mode]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT ('') FOR [description]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT ('') FOR [help_text]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT ('') FOR [help_link]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT ((0)) FOR [is_enabled]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT (suser_sname()) FOR [created_by]
ALTER TABLE [dbo].[syspolicy_policies_internal] ADD  DEFAULT ((0)) FOR [is_system]
ALTER TABLE [dbo].[syspolicy_policies_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_policies_sysjobs] FOREIGN KEY([job_id])
REFERENCES [dbo].[sysjobs] ([job_id])
ALTER TABLE [dbo].[syspolicy_policies_internal] CHECK CONSTRAINT [FK_syspolicy_policies_sysjobs]
ALTER TABLE [dbo].[syspolicy_policies_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_policies_syspolicy_conditions] FOREIGN KEY([condition_id])
REFERENCES [dbo].[syspolicy_conditions_internal] ([condition_id])
ALTER TABLE [dbo].[syspolicy_policies_internal] CHECK CONSTRAINT [FK_syspolicy_policies_syspolicy_conditions]
ALTER TABLE [dbo].[syspolicy_policies_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_policies_syspolicy_object_sets] FOREIGN KEY([object_set_id])
REFERENCES [dbo].[syspolicy_object_sets_internal] ([object_set_id])
ALTER TABLE [dbo].[syspolicy_policies_internal] CHECK CONSTRAINT [FK_syspolicy_policies_syspolicy_object_sets]
ALTER TABLE [dbo].[syspolicy_policies_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_policies_syspolicy_policy_categories] FOREIGN KEY([policy_category_id])
REFERENCES [dbo].[syspolicy_policy_categories_internal] ([policy_category_id])
ALTER TABLE [dbo].[syspolicy_policies_internal] CHECK CONSTRAINT [FK_syspolicy_policies_syspolicy_policy_categories]
ALTER TABLE [dbo].[syspolicy_policies_internal]  WITH CHECK ADD  CONSTRAINT [FK_syspolicy_policies_syspolicy_root_conditions] FOREIGN KEY([root_condition_id])
REFERENCES [dbo].[syspolicy_conditions_internal] ([condition_id])
ALTER TABLE [dbo].[syspolicy_policies_internal] CHECK CONSTRAINT [FK_syspolicy_policies_syspolicy_root_conditions]
/****** Object:  Trigger [dbo].[syspolicy_delete_job_delete_trigger]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_delete_job_delete_trigger] on [dbo].[syspolicy_policies_internal]
FOR DELETE
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	DECLARE @jobID uniqueidentifier 

	-- Declare the cursor to iterate over the jobs that are only referenced 
	-- by deleted policies. The jobs that are still referenced by active policies 
	-- should not be deleted.
	DECLARE deleted_cursor CURSOR LOCAL FOR 
		SELECT DISTINCT d.job_id
		FROM deleted d
		WHERE 
			((d.execution_mode & 4) = 4) AND
			NOT EXISTS (SELECT * FROM msdb.dbo.syspolicy_policies p 
							WHERE 
							p.job_id = d.job_id AND 
							((p.execution_mode & 4) = 4) AND
							p.policy_id NOT IN (SELECT d2.policy_id FROM deleted d2))

	OPEN deleted_cursor
	FETCH deleted_cursor INTO @jobID
	
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		-- delete the job(s), but do not delete the shared schedule
		IF (@jobID IS NOT NULL)
			EXEC msdb.dbo.sp_delete_job @job_id = @jobID, @delete_unused_schedule = 0

		FETCH deleted_cursor INTO @jobID
	END -- while (@@FETCH_STATUS=0)

    CLOSE deleted_cursor
    DEALLOCATE deleted_cursor


	-- See what jobs we need to disable.
	-- This can happen because we do not need to delete the job, but
	-- all policies that reference it are disabled.
	DECLARE jobs_to_disable CURSOR LOCAL FOR
		SELECT DISTINCT j.job_id
		FROM dbo.sysjobs_view j 
		JOIN deleted d ON d.job_id = j.job_id
		WHERE 
			j.enabled = 1 AND
			NOT EXISTS ( SELECT * from msdb.dbo.syspolicy_policies p2 
						WHERE p2.job_id = j.job_id AND p2.is_enabled = 1 AND ((p2.execution_mode & 4) = 4))
	
	OPEN jobs_to_disable
	FETCH jobs_to_disable INTO @jobID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC msdb.dbo.sp_update_job @job_id = @jobID, @enabled = 0
		
		FETCH jobs_to_disable INTO @jobID
	END
	CLOSE jobs_to_disable
	DEALLOCATE jobs_to_disable

	-- update eventing infrastructure
	IF EXISTS ( SELECT * FROM deleted d WHERE ((d.execution_mode & 1) = 1))
	BEGIN
		EXEC sys.sp_syspolicy_update_ddl_trigger 
	END

	IF EXISTS (SELECT * FROM deleted d WHERE ((d.execution_mode & 2) = 2))
	BEGIN
		EXEC sys.sp_syspolicy_update_event_notification 
	END

END

/****** Object:  Trigger [dbo].[syspolicy_insert_job_create_trigger]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_insert_job_create_trigger] on [dbo].[syspolicy_policies_internal]
FOR INSERT
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	-- protect against non-scheduled automation jobs
	-- that have expressions that execute script
	DECLARE @row_count int

    SELECT @row_count = count(*) 
        FROM syspolicy_conditions c  
        INNER JOIN inserted i ON (i.condition_id = c.condition_id OR i.root_condition_id = c.condition_id)
        WHERE    i.is_enabled != 0 AND
                i.execution_mode != 4 AND
                (1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteSql"]' ) OR
                1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteWql"]' ) ) 
        OPTION (FORCE ORDER);

    SELECT @row_count = @row_count + count(*)
        FROM dbo.syspolicy_target_set_levels l 
        INNER JOIN dbo.syspolicy_target_sets s ON s.target_set_id = l.target_set_id
        INNER JOIN syspolicy_conditions c on c.condition_id = l.condition_id
        INNER JOIN syspolicy_object_sets_internal os ON os.object_set_id = s.object_set_id
        INNER JOIN inserted i ON os.object_set_id = i.object_set_id
        WHERE    i.is_enabled != 0 AND
                i.execution_mode != 4 AND
                (1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteSql"]' ) OR
                1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteWql"]' ) )
        OPTION (FORCE ORDER);

    IF (@row_count > 0)
    BEGIN
        RAISERROR(34017, -1, -1);
        ROLLBACK TRANSACTION;
    END

	DECLARE @jobID uniqueidentifier
	DECLARE @schedule_uid uniqueidentifier
	DECLARE @is_enabled bit

	-- verify that values in inserted.schedule_uid are valid
	IF EXISTS (
		SELECT * FROM inserted i 
		WHERE i.schedule_uid NOT IN 
				(SELECT schedule_uid FROM msdb.dbo.sysschedules ) AND 
		((i.execution_mode & 4) = 4))
	BEGIN
		ROLLBACK -- Failure
		RAISERROR (14365, -1, -1)
		RETURN
	END

	-- find all schedules referenced by the inserted policies for which 
	-- there is no agent job that executes the policies
	DECLARE schedule_cursor CURSOR LOCAL FOR
	    SELECT DISTINCT i.schedule_uid
	    FROM inserted i
	    WHERE 
		    ((i.execution_mode & 4) = 4) AND
	        NOT EXISTS (SELECT * 
	                        FROM msdb.dbo.syspolicy_policies p 
	                        WHERE 
	                            p.policy_id NOT IN (SELECT policy_id FROM inserted) AND
	                            p.schedule_uid = i.schedule_uid AND 
	                            ((p.execution_mode & 4) = 4) )
	
	-- iterate through the cursor and create a job for every schedule		
	OPEN schedule_cursor
	FETCH schedule_cursor INTO @schedule_uid
	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- figure out if the job is enabled or not
		SELECT @is_enabled = COUNT(*) 
		FROM inserted i 
		WHERE i.schedule_uid = @schedule_uid AND i.is_enabled = 1
		
		-- explicitly nullify jobID, 
		-- (if we need to create more than 1 job, it will not be null and sp_add_job will think we're getting job from MSX)
		SET @jobID = NULL
		
		-- create the job that is going to execute the schedule
		EXEC [msdb].[dbo].[sp_syspolicy_create_job] @schedule_uid, @is_enabled, @jobID OUTPUT

		-- update the job_id back into the policies table
		UPDATE p SET p.job_id = @jobID 
			FROM msdb.dbo.syspolicy_policies_internal p
			INNER JOIN inserted i ON p.policy_id = i.policy_id
		WHERE 
			i.schedule_uid = @schedule_uid AND
			(i.execution_mode & 4) = 4

		FETCH schedule_cursor INTO @schedule_uid
	END
	
	CLOSE schedule_cursor
	DEALLOCATE schedule_cursor
	
	-- in case we haven't created the job we still need to update 
	-- the policies with their jobID
	UPDATE p
		SET p.job_id = ( SELECT TOP 1 p2.job_id 
						FROM msdb.dbo.syspolicy_policies p2 
						WHERE 
							p2.schedule_uid = p.schedule_uid AND 
							p2.job_id IS NOT NULL)
		FROM msdb.dbo.syspolicy_policies_internal p
		INNER JOIN inserted i ON p.policy_id = i.policy_id
		WHERE 
			((p.execution_mode & 4) = 4) AND
			p.job_id IS NULL
	
	-- See what jobs we need to enable.
	-- This can happen because we might create a new policy that 
	-- is enabled and there is already a job for it, but the existing
	-- job is disabled
	DECLARE jobs_to_enable CURSOR LOCAL FOR
		SELECT DISTINCT j.job_id
		FROM dbo.sysjobs_view j 
		JOIN msdb.dbo.syspolicy_policies p ON p.job_id = j.job_id
		JOIN inserted i ON p.policy_id = i.policy_id
		WHERE 
			((i.execution_mode & 4) = 4) AND
			j.enabled = 0 AND
			EXISTS ( SELECT * from msdb.dbo.syspolicy_policies p2 
						WHERE p2.job_id = j.job_id AND p2.is_enabled = 1)
	
	OPEN jobs_to_enable
	FETCH jobs_to_enable INTO @jobID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC msdb.dbo.sp_update_job @job_id = @jobID, @enabled = 1
		
		FETCH jobs_to_enable INTO @jobID
	END
	CLOSE jobs_to_enable
	DEALLOCATE jobs_to_enable
	
	-- enable events infrastructure
	IF EXISTS ( SELECT * FROM inserted i WHERE ((i.execution_mode & 1) = 1))
	BEGIN
		EXEC sys.sp_syspolicy_update_ddl_trigger 
	END

	IF EXISTS (SELECT * FROM inserted i WHERE ((i.execution_mode & 2) = 2))
	BEGIN
		EXEC sys.sp_syspolicy_update_event_notification 
	END

	-- update owner information
	UPDATE msdb.dbo.syspolicy_policies_internal
	SET created_by = original_login(),
		date_created = getdate (),
		date_modified = NULL,
		modified_by = NULL
	FROM inserted i,
	   msdb.dbo.syspolicy_policies_internal policies
	WHERE i.policy_id = policies.policy_id
	
END -- create trigger

/****** Object:  Trigger [dbo].[syspolicy_insert_policy_trigger]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_insert_policy_trigger] on [dbo].[syspolicy_policies_internal]
FOR INSERT
AS
BEGIN
    DECLARE @object_set_id int, @name sysname

	SELECT TOP 1 @object_set_id = i.object_set_id, @name = i.name 
	FROM inserted i 
	WHERE 1 < (SELECT count(*) FROM syspolicy_policies p WHERE p.object_set_id = i.object_set_id)

	IF @@ROWCOUNT > 0
	BEGIN
				DECLARE @os_name sysname, @policy_name sysname
				SELECT TOP 1 @os_name = os.object_set_name, @policy_name = p.name
				 FROM syspolicy_object_sets os 
					INNER JOIN syspolicy_policies p ON (os.object_set_id = p.object_set_id)
				WHERE os.object_set_id = @object_set_id AND p.name <> @name
				
				RAISERROR(34013, -1, -1, 'ObjectSet', @os_name, @policy_name) 
				ROLLBACK TRANSACTION
	END
END

/****** Object:  Trigger [dbo].[syspolicy_instead_delete_policy_trigger]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- when changing logic in this trigger, please remember to change the logic in #sp_syspolicy_cascade_delete_policy of alwayson.sql
-------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[syspolicy_instead_delete_policy_trigger] on [dbo].[syspolicy_policies_internal]
INSTEAD OF DELETE 
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	-- This trigger deletes references in given order to protect from deadlocks
	DELETE msdb.dbo.syspolicy_policy_execution_history_internal	WHERE policy_id in (SELECT policy_id FROM deleted)
	DELETE msdb.dbo.syspolicy_system_health_state_internal		WHERE policy_id in (SELECT policy_id FROM deleted)
	DELETE msdb.dbo.syspolicy_policies_internal		WHERE policy_id in (SELECT policy_id FROM deleted)
END

/****** Object:  Trigger [dbo].[syspolicy_update_job_update_trigger]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_update_job_update_trigger] on [dbo].[syspolicy_policies_internal]
FOR UPDATE
AS
BEGIN
	DECLARE @retval_check int;
	EXECUTE @retval_check = [dbo].[sp_syspolicy_check_membership] 'PolicyAdministratorRole'
	IF ( 0!= @retval_check)
	BEGIN
		RETURN;
	END

	-- This is to prevent indirect entrance of the trigger
	IF (TRIGGER_NESTLEVEL() > 1) RETURN

	-- verify that values in inserted.schedule_uid are valid
	IF EXISTS (
		SELECT * FROM inserted i 
		WHERE i.schedule_uid NOT IN 
				(SELECT schedule_uid FROM msdb.dbo.sysschedules ) AND 
		((i.execution_mode & 4) = 4))
	BEGIN
		ROLLBACK -- Failure
		RAISERROR (14365, -1, -1)
		RETURN
	END

	-- update eventing infrastructure
	IF(UPDATE(execution_mode) OR UPDATE(is_enabled))
	BEGIN
		IF  EXISTS (SELECT * 
					FROM inserted i
					INNER JOIN deleted d ON i.policy_id = d.policy_id
					WHERE 
						(((i.execution_mode & 1) = 1) OR ((d.execution_mode & 1) = 1)) AND 
						(i.is_enabled != d.is_enabled OR i.execution_mode != d.execution_mode))
		BEGIN
			EXEC sys.sp_syspolicy_update_ddl_trigger 
		END

		IF  EXISTS (SELECT * 
					FROM inserted i
					INNER JOIN deleted d ON i.policy_id = d.policy_id
					WHERE 
						(((i.execution_mode & 2) = 2) OR ((d.execution_mode & 2) = 2)) AND 
						(i.is_enabled != d.is_enabled OR i.execution_mode != d.execution_mode))
		BEGIN
			EXEC sys.sp_syspolicy_update_event_notification 
		END
	END

	DECLARE @jobID uniqueidentifier
	DECLARE @is_enabled bit
	DECLARE @schedule_uid uniqueidentifier

    -- set the job_id to NULL for all policies whose schedule_uid has changed
    -- so that we can create a job if needed
    UPDATE p
        SET p.job_id = NULL
        FROM msdb.dbo.syspolicy_policies p
        INNER JOIN inserted i ON p.policy_id = i.policy_id
        INNER JOIN deleted d ON d.policy_id = p.policy_id
        WHERE i.schedule_uid != d.schedule_uid

	-- find all schedules referenced by the inserted policies for which 
	-- there is no agent job that executes the policies
	DECLARE schedule_cursor CURSOR LOCAL FOR
	    SELECT DISTINCT i.schedule_uid
	    FROM inserted i
	    WHERE 
		    ((i.execution_mode & 4) = 4) AND
	        NOT EXISTS (SELECT * 
	                        FROM msdb.dbo.syspolicy_policies p 
	                        WHERE 
	                            p.schedule_uid = i.schedule_uid AND 
	                            ((p.execution_mode & 4) = 4) AND
	                            p.job_id IS NOT NULL)
	                    
	-- iterate through the cursor and create a job for every schedule		
	OPEN schedule_cursor
	FETCH schedule_cursor INTO @schedule_uid
	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- figure out if the job is enabled or not
		SELECT @is_enabled = COUNT(*) 
		FROM inserted i 
		WHERE i.schedule_uid = @schedule_uid AND i.is_enabled = 1
		
		-- create the job that is going to execute the schedule
		EXEC [msdb].[dbo].[sp_syspolicy_create_job] @schedule_uid, @is_enabled, @jobID OUTPUT

		-- update the job_id back into the policies table
		UPDATE p SET p.job_id = @jobID 
			FROM msdb.dbo.syspolicy_policies_internal p
			INNER JOIN inserted i ON p.policy_id = i.policy_id
		WHERE 
			i.schedule_uid = @schedule_uid AND
			(i.execution_mode & 4) = 4
	
		FETCH schedule_cursor INTO @schedule_uid
	END
	
	CLOSE schedule_cursor
	DEALLOCATE schedule_cursor
	
	-- in case we haven't created the job we still need to update 
	-- the policies with their jobID
	UPDATE p 
		SET p.job_id = ( SELECT TOP 1 p2.job_id 
						FROM msdb.dbo.syspolicy_policies p2 
						WHERE 
							p2.schedule_uid = p.schedule_uid AND
							p2.job_id IS NOT NULL)
		FROM msdb.dbo.syspolicy_policies p
		INNER JOIN inserted i ON p.policy_id = i.policy_id
		WHERE 
			((p.execution_mode & 4) = 4) AND
			p.job_id IS NULL
	
	-- if the execution_mode has changed then we need to clear the job references
	UPDATE p
		SET p.job_id = NULL
		FROM msdb.dbo.syspolicy_policies_internal p
		INNER JOIN inserted i ON p.policy_id = i.policy_id 
		INNER JOIN deleted d ON p.policy_id = d.policy_id
		WHERE 
			((i.execution_mode & 4) != 4) AND
			((d.execution_mode & 4) = 4) AND
			p.job_id IS NOT NULL
	
	-- See what jobs we need to enable.
	-- This can happen because we might create a new policy that 
	-- is enabled and there is already a job for it, but the existing
	-- job is disabled
	DECLARE jobs_to_enable CURSOR LOCAL FOR
		SELECT DISTINCT j.job_id
		FROM dbo.sysjobs_view j 
		JOIN msdb.dbo.syspolicy_policies p ON p.job_id = j.job_id
		JOIN inserted i ON p.policy_id = i.policy_id
		WHERE 
			((i.execution_mode & 4) = 4) AND
			j.enabled = 0 AND
			EXISTS ( SELECT * from msdb.dbo.syspolicy_policies p2 
						WHERE p2.job_id = j.job_id AND p2.is_enabled = 1)
	
	OPEN jobs_to_enable
	FETCH jobs_to_enable INTO @jobID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC msdb.dbo.sp_update_job @job_id = @jobID, @enabled = 1
		
		FETCH jobs_to_enable INTO @jobID
	END
	CLOSE jobs_to_enable
	DEALLOCATE jobs_to_enable

	-- Find out what jobs have to be deleted because the policy's schedule 
	-- has changed
	IF (UPDATE(schedule_uid))
	BEGIN
		DECLARE deleted_cursor CURSOR LOCAL FOR 
			SELECT DISTINCT d.job_id
			FROM deleted d
			WHERE 
				((d.execution_mode & 4) = 4) AND
				d.job_id NOT IN (SELECT job_id FROM msdb.dbo.syspolicy_policies p 
								WHERE 
								((p.execution_mode & 4) = 4))

		OPEN deleted_cursor
		FETCH deleted_cursor INTO @jobID
		
		WHILE (@@FETCH_STATUS=0)
		BEGIN
			-- delete the job(s), but do not delete the shared schedule
			IF (@jobID IS NOT NULL)
				EXEC msdb.dbo.sp_delete_job @job_id = @jobID, @delete_unused_schedule = 0

			FETCH deleted_cursor INTO @jobID
		END -- while (@@FETCH_STATUS=0)

		CLOSE deleted_cursor
		DEALLOCATE deleted_cursor
	END	-- UPDATE(schedule_uid)


	-- See what jobs we need to disable.
	-- This can happen because we do not need to delete the job, but
	-- all policies that reference it are disabled.
	DECLARE jobs_to_disable CURSOR LOCAL FOR
		SELECT DISTINCT j.job_id
		FROM dbo.sysjobs_view j 
		JOIN msdb.dbo.syspolicy_policies p ON p.job_id = j.job_id
		WHERE 
			j.enabled = 1 AND
			NOT EXISTS ( SELECT * from msdb.dbo.syspolicy_policies p2 
						WHERE p2.job_id = j.job_id AND p2.is_enabled = 1 AND ((p2.execution_mode & 4) = 4))
	
	OPEN jobs_to_disable
	FETCH jobs_to_disable INTO @jobID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC msdb.dbo.sp_update_job @job_id = @jobID, @enabled = 0
		
		FETCH jobs_to_disable INTO @jobID
	END
	CLOSE jobs_to_disable
	DEALLOCATE jobs_to_disable

    UPDATE msdb.dbo.syspolicy_policies_internal
    SET modified_by = original_login(),
        date_modified = GETDATE()
    FROM inserted i,
       msdb.dbo.syspolicy_policies_internal policies
    WHERE i.policy_id = policies.policy_id
END -- update trigger

/****** Object:  Trigger [dbo].[syspolicy_update_policy_trigger]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER [dbo].[syspolicy_update_policy_trigger] on [dbo].[syspolicy_policies_internal]
FOR UPDATE
AS
BEGIN
    -- Protect against non-scheduled enabled policies that have scripts in their conditions
    IF( UPDATE(is_enabled) )
    BEGIN
        DECLARE @row_count int

        SELECT @row_count = count(*) 
            FROM syspolicy_conditions c  
            INNER JOIN inserted i ON (i.condition_id = c.condition_id OR i.root_condition_id = c.condition_id)
            WHERE    i.is_enabled != 0 AND
                    i.execution_mode != 4 AND
                    (1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteSql"]' ) OR
                    1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteWql"]' ) ) 
            OPTION (FORCE ORDER)

        SELECT @row_count = @row_count + count(*)
            FROM dbo.syspolicy_target_set_levels l 
            INNER JOIN dbo.syspolicy_target_sets s ON s.target_set_id = l.target_set_id
            INNER JOIN syspolicy_conditions c on c.condition_id = l.condition_id
            INNER JOIN syspolicy_object_sets_internal os on os.object_set_id = s.object_set_id
            INNER JOIN inserted i ON os.object_set_id = i.object_set_id
            WHERE    i.is_enabled != 0 AND
                    i.execution_mode != 4 AND
                    (1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteSql"]' ) OR
                    1 = CONVERT(xml, c.expression).exist('//FunctionType/text()[.="ExecuteWql"]' ) )
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
	
	-- This is to prevent indirect execution of the trigger
	IF (TRIGGER_NESTLEVEL() > 1) RETURN

    IF( UPDATE(condition_id) )
    BEGIN
        -- delete all health state records for active policies whose 
        -- condition has changed
        DELETE FROM [dbo].[syspolicy_system_health_state_internal] 
            FROM [dbo].[syspolicy_system_health_state_internal] phs
            INNER JOIN inserted i ON phs.policy_id = i.policy_id
            INNER JOIN deleted d ON phs.policy_id = d.policy_id
            WHERE d.condition_id != i.condition_id AND i.is_enabled = 1
    END

    IF( UPDATE(object_set_id) )
    BEGIN
        DECLARE @object_set_id int, @numref int, @new_object_set_id int, @name sysname
        
        DECLARE os_cursor CURSOR LOCAL FOR 
        SELECT i.object_set_id, d.object_set_id, i.name
        FROM inserted i INNER JOIN deleted d ON (i.policy_id = d.policy_id) 
        WHERE (d.object_set_id IS NOT NULL AND i.object_set_id IS NULL)
			OR (i.object_set_id IS NOT NULL AND d.object_set_id IS NULL)
			OR (d.object_set_id != i.object_set_id)

        OPEN os_cursor
        FETCH os_cursor INTO @new_object_set_id, @object_set_id, @name
    
        WHILE @@FETCH_STATUS = 0 
        BEGIN
			IF (@object_set_id IS NOT NULL)
			BEGIN
				EXEC sp_syspolicy_verify_object_set_references @object_set_id, @numref OUTPUT
				IF (@numref = 0)
					EXEC sp_syspolicy_delete_object_set @object_set_id=@object_set_id
            END
            
			IF (@new_object_set_id IS NOT NULL)
			BEGIN
				EXEC sp_syspolicy_verify_object_set_references @new_object_set_id, @numref OUTPUT
				IF (@numref > 1)
				BEGIN
					DECLARE @os_name sysname, @policy_name sysname
					SELECT TOP 1 @os_name = os.object_set_name, @policy_name = p.name
					 FROM syspolicy_object_sets os 
						INNER JOIN syspolicy_policies p ON (os.object_set_id = p.object_set_id)
					WHERE os.object_set_id = @object_set_id AND p.name <> @name
					
					RAISERROR(34013, -1, -1, 'ObjectSet', @os_name, @policy_name) 
					ROLLBACK TRANSACTION
				END
            END
                
            FETCH os_cursor INTO @new_object_set_id, @object_set_id, @name
        END
            
        CLOSE os_cursor
        DEALLOCATE os_cursor    

    END

    IF( UPDATE(is_enabled) )
    BEGIN
        -- delete all health state records for policies that 
        -- have been disabled
        DELETE FROM [dbo].[syspolicy_system_health_state_internal] 
            FROM [dbo].[syspolicy_system_health_state_internal] phs
            INNER JOIN inserted i ON phs.policy_id = i.policy_id
            INNER JOIN deleted d ON phs.policy_id = d.policy_id
            WHERE d.is_enabled = 1 AND i.is_enabled = 0
    END

END

GO
