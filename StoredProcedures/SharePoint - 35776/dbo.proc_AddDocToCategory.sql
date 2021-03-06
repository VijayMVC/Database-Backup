/****** Object:  StoredProcedure [dbo].[proc_AddDocToCategory]    Script Date: 5/15/2018 12:11:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddDocToCategory(
    @DocId uniqueidentifier,
    @WebId uniqueidentifier,
    @Category nvarchar(128))
AS
    SET NOCOUNT ON
    DECLARE @CategoryId uniqueidentifier
    SELECT
        @CategoryId = CategoryId
    FROM
        WebCat
    WHERE
        WebId = @WebId AND
        Category = @Category
    IF @CategoryId IS NULL
    BEGIN
        SELECT @CategoryId = NEWID()
        INSERT INTO WebCat (
            WebId,
            CategoryId,
            Category)
        VALUES (
            @WebId,
            @CategoryId,
            @Category)
    END
    INSERT INTO Categories (
        DocId,
        CategoryId)
    VALUES (
        @DocId,
        @CategoryId)

GO
