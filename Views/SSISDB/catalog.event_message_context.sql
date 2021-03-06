/****** Object:  View [catalog].[event_message_context]    Script Date: 5/15/2018 12:14:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [catalog].[event_message_context]
AS
SELECT     [context_id],
           [event_message_id],
           [context_depth],
           [package_path],
           [context_type],
           [context_source_name],
           [context_source_id],
           [property_name],
           [property_value]
FROM       [internal].[event_message_context]
WHERE      [operation_id] in (SELECT [id] FROM [internal].[current_user_readable_operations])
           OR (IS_MEMBER('ssis_admin') = 1)
           OR (IS_SRVROLEMEMBER('sysadmin') = 1)

GO
