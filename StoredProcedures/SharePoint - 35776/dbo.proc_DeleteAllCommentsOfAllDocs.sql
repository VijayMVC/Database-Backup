/****** Object:  StoredProcedure [dbo].[proc_DeleteAllCommentsOfAllDocs]    Script Date: 5/15/2018 12:11:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteAllCommentsOfAllDocs(
    @SiteId  uniqueidentifier,
    @WebId   uniqueidentifier,
    @DocDir  nvarchar(256) )
AS
    SET NOCOUNT ON
    IF @DocDir IS NULL 
    BEGIN
        DELETE
            ComMd
        FROM
            ComMd, Docs
        WHERE
            Docs.Id = ComMd.DocId AND
            Docs.SiteId = @SiteId AND
            ComMd.SiteId = @SiteId AND
            Docs.WebId = @WebId
    END
    ELSE  
    BEGIN
        DELETE
            ComMd
        FROM
            ComMd, Docs
        WHERE
            Docs.Id = ComMd.DocId AND
            Docs.SiteId = @SiteId AND
            Docs.DirName = @DocDir AND
            ComMd.SiteId = @SiteId AND
            Docs.WebId = @WebId
    END
    RETURN 0

GO
