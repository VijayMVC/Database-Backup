/****** Object:  View [catalog].[executable_statistics]    Script Date: 5/15/2018 12:14:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [catalog].[executable_statistics]
AS
SELECT     [statistics_id], 
           [execution_id],
           [executable_id], 
           [execution_path], 
           [start_time],
           [end_time],
           [execution_duration], 
           [execution_result],
           [execution_value]
FROM       [internal].[executable_statistics]
WHERE      [execution_id] in (SELECT id FROM [internal].[current_user_readable_operations])
           OR (IS_MEMBER('ssis_admin') = 1)
           OR (IS_SRVROLEMEMBER('sysadmin') = 1)


GO
