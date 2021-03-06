/****** Object:  DdlTrigger [ddl_cleanup_object_permissions]    Script Date: 5/15/2018 12:15:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TRIGGER ddl_cleanup_object_permissions
ON DATABASE
WITH EXECUTE AS 'AllSchemaOwner'
FOR DROP_USER,DROP_ROLE,DROP_APPLICATION_ROLE
AS
    IF EXISTS 
    (
        SELECT [grantor_sid]
        FROM [internal].[object_permissions]
        WHERE [grantor_sid] NOT IN
            (SELECT [sid] FROM [sys].[database_principals] where [sid] IS NOT NULL)
    )
    BEGIN
        ROLLBACK TRAN
        RAISERROR(27226, 16, 1) WITH NOWAIT
    END
    ELSE
    BEGIN
        DELETE FROM [internal].[folder_permissions]
        WHERE [sid] NOT IN
            (SELECT [sid] FROM [sys].[database_principals] where [sid] IS NOT NULL)
        
        DELETE FROM [internal].[project_permissions]
        WHERE [sid] NOT IN
            (SELECT [sid] FROM [sys].[database_principals] where [sid] IS NOT NULL)
        
        DELETE FROM [internal].[environment_permissions]
        WHERE [sid] NOT IN
            (SELECT [sid] FROM [sys].[database_principals] where [sid] IS NOT NULL)
        
        DELETE FROM [internal].[operation_permissions]
        WHERE [sid] NOT IN
            (SELECT [sid] FROM [sys].[database_principals] where [sid] IS NOT NULL)
    END

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
ENABLE TRIGGER [ddl_cleanup_object_permissions] ON DATABASE
GO
