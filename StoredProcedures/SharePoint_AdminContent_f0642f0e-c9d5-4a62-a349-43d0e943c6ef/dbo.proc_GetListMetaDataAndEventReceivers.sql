/****** Object:  StoredProcedure [dbo].[proc_GetListMetaDataAndEventReceivers]    Script Date: 5/15/2018 12:12:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetListMetaDataAndEventReceivers(
    @SiteId uniqueidentifier,
    @WebId  uniqueidentifier,
    @ListId uniqueidentifier,
    @PrefetchListScope bit = 0,
    @PrefetchWebParts bit = 0,
    @UserId int = -1)
AS
    SET NOCOUNT ON
    EXEC proc_GetListMetaData @WebId, @ListId, @PrefetchListScope
    EXEC proc_GetEventReceivers @SiteId, @WebId, @ListId, 2
    IF (@PrefetchWebParts = 1)
    BEGIN
        EXEC proc_GetListWebParts @ListId, @UserId, 0, 0, 0, @SiteId
    END

GO
