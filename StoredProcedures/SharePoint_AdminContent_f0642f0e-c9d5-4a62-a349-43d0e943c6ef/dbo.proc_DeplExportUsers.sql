/****** Object:  StoredProcedure [dbo].[proc_DeplExportUsers]    Script Date: 5/15/2018 12:12:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplExportUsers(
    @SiteId uniqueidentifier,
    @UserIdCur int)
AS
    SET NOCOUNT ON
    SELECT DISTINCT TOP 100
        tp_SiteId,
        tp_Id,
        tp_Title,
        tp_Login,
        tp_Email,
        tp_Notes,
        tp_DomainGroup,
        tp_SiteAdmin,
        tp_SystemId,
        tp_Deleted
    FROM
        UserInfo
    WHERE
        tp_SiteId = @SiteId AND
        tp_Id > @UserIdCur AND
        tp_Id <> 1073741823
    ORDER BY
        tp_SiteId, tp_Id

GO
