/****** Object:  StoredProcedure [dbo].[proc_GetWebIdOfListId]    Script Date: 5/15/2018 12:12:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_GetWebIdOfListId(
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT tp_WebId FROM Lists WHERE tp_ID = @ListId

GO
