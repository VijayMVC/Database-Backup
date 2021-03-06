/****** Object:  StoredProcedure [dbo].[proc_GenerateNextId]    Script Date: 5/15/2018 12:12:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GenerateNextId(
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @NumIds int = 1)
AS
    SET NOCOUNT ON
    DECLARE @NextId int
    BEGIN TRAN
    SELECT
        @NextId = tp_NextAvailableId
    FROM
        Lists WITH (UPDLOCK)
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @ListId
    UPDATE
        Lists
    SET
        tp_NextAvailableId = @NextId + @NumIds
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @ListId
    COMMIT TRAN
    RETURN @NextId

GO
