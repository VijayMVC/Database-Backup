/****** Object:  StoredProcedure [dbo].[proc_SecGetPrincipalByLogin]    Script Date: 5/15/2018 12:12:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetPrincipalByLogin(
    @SiteId uniqueidentifier,
    @Login nvarchar(255),
    @GetSTSToken      bit = 0,
    @GetExternalToken bit = 0)
AS
    SET NOCOUNT ON
    SELECT TOP 1
        tp_ID,
        tp_SystemID,
        tp_Title,
        tp_Login,
        tp_Email,
        tp_Notes,
        tp_SiteAdmin,
        tp_DomainGroup,
        CASE WHEN @GetExternalToken = 1 THEN tp_ExternalTokenLastUpdated ELSE NULL END,
        CASE WHEN @GetExternalToken = 1 THEN tp_ExternalToken ELSE NULL END,
        CASE WHEN @GetSTSToken = 1 THEN tp_token ELSE NULL END
    FROM
        UserInfo
    WHERE
        tp_SiteId = @SiteId AND
        tp_Login = @Login AND
        tp_Deleted = 0

GO
