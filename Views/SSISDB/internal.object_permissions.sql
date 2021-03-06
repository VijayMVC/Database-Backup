/****** Object:  View [internal].[object_permissions]    Script Date: 5/15/2018 12:14:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

create view [internal].[object_permissions]
AS
SELECT     CAST(1 AS SmallInt) AS [object_type], 
           [object_id], 
           [sid],
           [permission_type],
           [is_role],
           [is_deny],
           [grantor_sid]
FROM       [internal].[folder_permissions]
UNION ALL
SELECT     CAST(2 AS SmallInt) AS [object_type], 
           [object_id], 
           [sid],
           [permission_type],
           [is_role],
           [is_deny],
           [grantor_sid]
FROM       [internal].[project_permissions]
UNION ALL
SELECT     CAST(3 AS SmallInt) AS [object_type], 
           [object_id],
           [sid],
           [permission_type],
           [is_role],
           [is_deny],
           [grantor_sid]
FROM       [internal].[environment_permissions]
UNION ALL
SELECT     CAST(4 AS SmallInt) AS [object_type], 
           [object_id], 
           [sid],
           [permission_type],
           [is_role],
           [is_deny],
           [grantor_sid]
FROM       [internal].[operation_permissions]

GO
