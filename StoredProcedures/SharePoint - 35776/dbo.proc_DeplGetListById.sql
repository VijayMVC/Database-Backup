/****** Object:  StoredProcedure [dbo].[proc_DeplGetListById]    Script Date: 5/15/2018 12:11:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListById(
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    IF @ListId IS NULL
        RETURN 87
    SELECT
        Lists.tp_WebId
    FROM
        Lists
    WHERE
        Lists.tp_ID = @ListId

GO
