/****** Object:  StoredProcedure [dbo].[proc_EnumRecycleBinItemsForCleanup]    Script Date: 5/15/2018 12:11:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EnumRecycleBinItemsForCleanup(
    @Days int)
AS
    SET NOCOUNT ON
    SELECT
        RecycleBin.SiteId,
        RecycleBin.WebId,
        CAST(RecycleBin.DeleteTransactionId AS uniqueidentifier)
    FROM 
        RecycleBin
    INNER JOIN
        Sites
    ON
        RecycleBin.SiteId = Sites.Id
    WHERE
        (RecycleBin.BinId = 1 OR
        RecycleBin.BinId = 2) AND
        RecycleBin.DeleteDate + @Days <= GETUTCDATE()
    RETURN 0

GO
