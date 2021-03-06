/****** Object:  StoredProcedure [dbo].[proc_UnmapContentTypeFromList]    Script Date: 5/15/2018 12:12:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_UnmapContentTypeFromList(
    @SiteId uniqueidentifier,
    @ContentTypeId tContentTypeId)
AS
    SET NOCOUNT ON
    DELETE
        ContentTypeUsage
    WHERE
        SiteId = @SiteId AND
        ContentTypeId >= @ContentTypeId AND
        ContentTypeId <= (@ContentTypeId + 0xff)

GO
