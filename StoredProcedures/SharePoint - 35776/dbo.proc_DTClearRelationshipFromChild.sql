/****** Object:  StoredProcedure [dbo].[proc_DTClearRelationshipFromChild]    Script Date: 5/15/2018 12:11:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DTClearRelationshipFromChild(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128)
)
AS
    SET NOCOUNT ON
    UPDATE Docs
    SET
        ParentVersion = NULL,
        TransformerId = NULL,
        ParentLeafName = NULL
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName
    DECLARE @FullUrl nvarchar(260)
    SET @FullUrl = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
    DELETE FROM
        Deps
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        DepType = 8 AND
        FullUrl = @FullUrl

GO
