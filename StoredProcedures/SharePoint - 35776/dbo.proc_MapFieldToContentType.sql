/****** Object:  StoredProcedure [dbo].[proc_MapFieldToContentType]    Script Date: 5/15/2018 12:12:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_MapFieldToContentType(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ContentTypeId tContentTypeId,
    @FieldId uniqueidentifier)
AS
    SET NOCOUNT ON
    IF NOT EXISTS (
        SELECT
            @SiteId
        FROM
            ContentTypeUsage
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND 
            @ContentTypeId >= ContentTypeId AND
            @ContentTypeId <= (ContentTypeId + 0xff) AND
            ListId = @FieldId AND
            IsFieldId = 1)
    BEGIN
        INSERT INTO
            ContentTypeUsage(SiteId, WebId, ContentTypeId, ListId, IsFieldId, Class)
        VALUES
            (@SiteId, @WebId, @ContentTypeId, @FieldId, 1, 0)
    END    

GO
