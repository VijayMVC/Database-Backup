/****** Object:  StoredProcedure [dbo].[proc_WorkflowHasVisibleParentItem]    Script Date: 5/15/2018 12:12:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_WorkflowHasVisibleParentItem (
        @SiteId                uniqueidentifier,
        @WorkflowInstanceId    uniqueidentifier
        )
AS
    SET NOCOUNT ON
    DECLARE @ListId uniqueidentifier
    DECLARE @ItemId int
    DECLARE @HasVisibleParentItem int
    SET @HasVisibleParentItem = 0
    SELECT TOP 1
        @ListId = ListId,
        @ItemId = ItemId
    FROM
        dbo.Workflow
    WHERE
        SiteId = @SiteId AND
        Id = @WorkflowInstanceId
    IF @@ROWCOUNT = 1
    BEGIN
        IF EXISTS (SELECT TOP 1
                       tp_ID
                  FROM
                       dbo.UserData
                  WHERE
                       tp_ListId = @ListId AND
                       tp_ID = @ItemId)
        BEGIN
            SET @HasVisibleParentItem = 1
        END
    END
    RETURN @HasVisibleParentItem    

GO
