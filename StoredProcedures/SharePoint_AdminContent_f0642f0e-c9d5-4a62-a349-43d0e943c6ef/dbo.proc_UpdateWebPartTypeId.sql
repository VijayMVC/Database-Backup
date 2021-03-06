/****** Object:  StoredProcedure [dbo].[proc_UpdateWebPartTypeId]    Script Date: 5/15/2018 12:13:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateWebPartTypeId(
    @SiteId uniqueidentifier,
    @WebPartId uniqueidentifier,
    @WebPartTypeId uniqueidentifier)
AS
    SET NOCOUNT ON
    UPDATE
        WebParts
    SET
        tp_WebPartTypeId = @WebPartTypeId
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID = @WebPartId
    IF (0 <> @@ERROR)
        RETURN -2147467259
    RETURN 0

GO
