/****** Object:  StoredProcedure [dbo].[proc_SecCheckDeletedAccounts]    Script Date: 5/15/2018 12:12:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecCheckDeletedAccounts(
    @SiteId uniqueidentifier,
    @Login nvarchar(255))
AS
    SET NOCOUNT ON
    SELECT
        tp_Login
    FROM
        UserInfo
    WHERE
        tp_SiteId = @SiteId AND
        tp_Login = @Login

GO
