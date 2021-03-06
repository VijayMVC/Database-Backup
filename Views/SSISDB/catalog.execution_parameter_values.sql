/****** Object:  View [catalog].[execution_parameter_values]    Script Date: 5/15/2018 12:14:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [catalog].[execution_parameter_values]
AS
SELECT     [execution_parameter_id], 
           [execution_id],
           [object_type], 
           [parameter_data_type], 
           [parameter_name], 
           [parameter_value], 
           [sensitive],
           [required],
           [value_set], 
           [runtime_override]
FROM       [internal].[execution_parameter_values]
WHERE      [execution_id] in (SELECT [id] FROM [internal].[current_user_readable_operations])
           OR (IS_MEMBER('ssis_admin') = 1)
           OR (IS_SRVROLEMEMBER('sysadmin') = 1)

GO
