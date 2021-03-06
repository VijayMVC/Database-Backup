/****** Object:  StoredProcedure [dbo].[proc_GetWorkflowDataForItem]    Script Date: 5/15/2018 12:12:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWorkflowDataForItem (
        @SiteId                uniqueidentifier,
        @WebId                 uniqueidentifier,
        @ListId                uniqueidentifier,
        @ItemId                int,
        @ContentTypeId         tContentTypeId,
        @gwfdi                 int = 0x0000000F,
        @InclusiveFilterState  int = 0xFFFFFFFF,
        @ExclusiveFilterState  int = 0
        )
AS
    SET NOCOUNT ON
    IF (@gwfdi & 0x00000001) <> 0
    BEGIN
        EXEC proc_GetWorkflowAssociations @SiteId, @WebId, NULL, @ListId, NULL
    END
    IF (@gwfdi & 0x00000002) <> 0
    BEGIN
        EXEC proc_GetWorkflowAssociations @SiteId, @WebId, NULL, NULL, @ContentTypeId
    END
    IF (@gwfdi & 0x00000004) <> 0
    BEGIN
        EXEC proc_GetListItemWorkflows @SiteId, @WebId, @ListId, @ItemId, NULL, NULL, @InclusiveFilterState, @ExclusiveFilterState
    END

GO
