/****** Object:  View [catalog].[execution_data_statistics]    Script Date: 5/15/2018 12:14:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [catalog].[execution_data_statistics]
AS
SELECT    [data_stats_id],
          [execution_id],
          [package_name],
          [task_name],
          [dataflow_path_id_string],
          [dataflow_path_name],
          [source_component_name],
          [destination_component_name],
          [rows_sent],
          [created_time],
          [execution_path]
FROM      [internal].[execution_data_statistics]
WHERE     [execution_id] in (SELECT [id] FROM [internal].[current_user_readable_operations])
          OR (IS_MEMBER('ssis_admin') = 1)
          OR (IS_SRVROLEMEMBER('sysadmin') = 1)

GO
