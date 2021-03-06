/****** Object:  StoredProcedure [dbo].[proc_DeplReserveNextAvailableId]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplReserveNextAvailableId(
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ListItemId int)
AS
    SET NOCOUNT ON
    IF @WebId <> '00000000-0000-0000-0000-000000000000' AND
       @ListItemId > 0
    BEGIN
        SET @ListItemId = @ListItemId + 1
        EXEC proc_SetNextId @WebId, @ListId, @ListItemId
    END

GO
