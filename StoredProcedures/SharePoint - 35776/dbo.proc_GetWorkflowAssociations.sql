/****** Object:  StoredProcedure [dbo].[proc_GetWorkflowAssociations]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWorkflowAssociations (
        @SiteId                uniqueidentifier,
        @WebId                 uniqueidentifier,
        @Id                    uniqueidentifier,
        @ListId                uniqueidentifier,
        @ContentTypeId         tContentTypeId
        )
AS
    SET NOCOUNT ON
    DECLARE @OverQuotaOrLocked int
    SELECT @OverQuotaOrLocked = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@Id IS NOT NULL)
        BEGIN
            SELECT TOP 1
                Id, BaseId, ParentId, Name, Description, StatusFieldName, SiteId, WebId, ListId, ContentTypeId, InstanceCount, TaskListId, HistoryListId, TaskListTitle, HistoryListTitle, Author, Created, Modified, PermissionsManual, Version, AutoCleanupDays,
                InstantiationParams,
                (Configuration | (CASE WHEN @OverQuotaOrLocked = 1 THEN 8192
                                       WHEN @OverQuotaOrLocked > 1 THEN 16384
                                       ELSE 0 END)) as Configuration
            FROM
                dbo.WorkflowAssociation
            WHERE
                SiteId = @SiteId AND
                Id = @Id
        END
    ELSE
        BEGIN
            SELECT ALL
                Id, BaseId, ParentId, Name, Description, StatusFieldName, SiteId, WebId, ListId, ContentTypeId, InstanceCount, TaskListId, HistoryListId, TaskListTitle, HistoryListTitle, Author, Created, Modified, PermissionsManual, Version, AutoCleanupDays,
                InstantiationParams,
                (Configuration | (CASE WHEN @OverQuotaOrLocked = 1 THEN 8192
                                       WHEN @OverQuotaOrLocked > 1 THEN 16384
                                       ELSE 0 END)) as Configuration
            FROM
                dbo.WorkflowAssociation
            WHERE
                SiteId = @SiteId AND
                (@WebId IS NULL OR
                    WebId = @WebId) AND
                (@ListId IS NULL OR
                    ListId = @ListId) AND
                (@ContentTypeId IS NULL OR
                    ContentTypeId = @ContentTypeId) AND
                ((Configuration & 512) = 0)
        END

GO
