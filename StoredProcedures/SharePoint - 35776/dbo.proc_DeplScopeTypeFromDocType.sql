/****** Object:  StoredProcedure [dbo].[proc_DeplScopeTypeFromDocType]    Script Date: 5/15/2018 12:11:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplScopeTypeFromDocType(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @DocId uniqueidentifier,
    @Type tinyint,
    @ScopeType int OUTPUT,
    @ObjectId uniqueidentifier OUTPUT)
AS
    SET NOCOUNT ON
    IF (@Type = 0)
    BEGIN
        SET @ScopeType = 2
        SET @ObjectId = @DocId
    END
    ELSE IF (@Type = 2)
    BEGIN
        SET @ScopeType = 0
        SET @ObjectId = @WebId
    END
    ELSE IF (@Type = 1)
    BEGIN
        IF EXISTS (
            SELECT tp_Id
                FROM
                    Lists
                WHERE
                    tp_WebId = @WebId AND
                    tp_RootFolder = @DocId)
        BEGIN
            SET @ScopeType = 1
            SET @ObjectId = @ListId
        END
        ELSE
        BEGIN
            SET @ScopeType = 2
            SET @ObjectId = @DocId
        END
    END
    ELSE
        RETURN 2

GO
