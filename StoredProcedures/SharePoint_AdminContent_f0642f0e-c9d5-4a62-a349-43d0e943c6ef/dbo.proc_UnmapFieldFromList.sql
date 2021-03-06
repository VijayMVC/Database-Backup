/****** Object:  StoredProcedure [dbo].[proc_UnmapFieldFromList]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_UnmapFieldFromList(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ContentTypeId tContentTypeId)
AS
    SET NOCOUNT ON
    DELETE
        ContentTypeUsage
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        ListId  = @ListId AND
        ContentTypeId = @ContentTypeId

GO
