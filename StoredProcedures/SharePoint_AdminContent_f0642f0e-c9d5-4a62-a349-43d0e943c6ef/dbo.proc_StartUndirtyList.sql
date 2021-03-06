/****** Object:  StoredProcedure [dbo].[proc_StartUndirtyList]    Script Date: 5/15/2018 12:13:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_StartUndirtyList(
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @CacheParseId uniqueidentifier)
AS
    SET NOCOUNT ON
    UPDATE Lists
    SET
        tp_CacheParseId = @CacheParseId
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @ListId

GO
