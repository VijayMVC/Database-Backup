/****** Object:  StoredProcedure [dbo].[proc_SecSetWebRequestAccess]    Script Date: 5/15/2018 12:12:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecSetWebRequestAccess(
    @WebId uniqueidentifier,
    @RequestAccessEmail nvarchar(255))
AS
    SET NOCOUNT ON
    UPDATE
        Webs
    SET
        RequestAccessEmail = @RequestAccessEmail        
    WHERE
        Webs.Id = @WebId

GO
