/****** Object:  StoredProcedure [dbo].[proc_SetListRequestAccess]    Script Date: 5/15/2018 12:12:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetListRequestAccess
(
    @SiteID        uniqueidentifier,
    @WebID       uniqueidentifier,
    @ListID         uniqueidentifier,
    @RequestAccess  bit
)
AS
BEGIN
    DECLARE @ReqAcc int
    IF (@RequestAccess = 0)
        SET @ReqAcc = 0x200
    ELSE
        SET @ReqAcc = 0
    UPDATE
        Lists
    SET
        tp_Flags = (tp_Flags & (~ CAST (0x200 AS INT))) ^ @ReqAcc
    WHERE
        tp_WebId = @WebID AND
        tp_ID = @ListID
    EXEC proc_LogChange @SiteId, @WebId, @ListId, NULL, NULL, NULL, NULL, NULL,
        8192, 2, NULL
END

GO
