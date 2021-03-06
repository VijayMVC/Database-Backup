/****** Object:  StoredProcedure [dbo].[proc_SecReCalculateWebFGP]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecReCalculateWebFGP(
    @SiteId  uniqueidentifier,
    @WebId   uniqueidentifier)
AS
    UPDATE 
        Webs
    SET 
        Flags = dbo.fn_SecRecalculateWebFGP(@SiteId, @WebId)
    WHERE
        Id = @WebId
    EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, NULL, NULL, NULL,
        NULL, 8192, 4, NULL

GO
