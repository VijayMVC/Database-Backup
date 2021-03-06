/****** Object:  StoredProcedure [dbo].[proc_GetRecycleBinInfo]    Script Date: 5/15/2018 12:12:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetRecycleBinInfo(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @UserId int,
    @ItemCount int OUTPUT,
    @Size bigint OUTPUT)
AS
    SET NOCOUNT ON
    SELECT
        @ItemCount = COUNT(*),
        @Size = ISNULL(SUM(Size),0)
    FROM
        RecycleBin
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        BinId = 1 AND
        DeleteUserId = @UserId
    IF @ItemCount IS NULL
    BEGIN
        SET @ItemCount = 0
        SET @Size = 0
    END
    RETURN 0

GO
