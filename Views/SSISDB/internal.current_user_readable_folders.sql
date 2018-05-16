/****** Object:  View [internal].[current_user_readable_folders]    Script Date: 5/15/2018 12:14:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [internal].[current_user_readable_folders]
AS
SELECT     [object_id] AS [ID]
FROM       [catalog].[effective_object_permissions]
WHERE      [object_type] = 1
           AND  [permission_type] = 1

GO
