/****** Object:  StoredProcedure [dbo].[proc_SecListAllWebMembers]    Script Date: 5/15/2018 12:12:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecListAllWebMembers(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        tp_ID,
        tp_SystemID,
        tp_Title,
        tp_Login,
        tp_Email,
        tp_Notes,
        tp_SiteAdmin,
        tp_DomainGroup
    FROM
        WebMembers
    INNER LOOP JOIN
        UserInfo
    ON
        UserInfo.tp_SiteId = @SiteId AND
        UserInfo.tp_ID = WebMembers.UserId AND
        WebMembers.WebId = @WebId
    WHERE
        UserInfo.tp_Deleted = 0
    OPTION (FORCE ORDER)

GO
