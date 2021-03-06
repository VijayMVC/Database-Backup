/****** Object:  StoredProcedure [dbo].[proc_MapContentTypeToList]    Script Date: 5/15/2018 12:12:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_MapContentTypeToList(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ContentTypeId tContentTypeId,
    @Class bit)
AS
    SET NOCOUNT ON
    INSERT
        ContentTypeUsage
    VALUES
        (@SiteId, @ContentTypeId, @WebId, @ListId, 0, @Class)

GO
