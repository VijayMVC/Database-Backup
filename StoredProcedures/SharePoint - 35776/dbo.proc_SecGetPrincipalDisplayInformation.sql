/****** Object:  StoredProcedure [dbo].[proc_SecGetPrincipalDisplayInformation]    Script Date: 5/15/2018 12:12:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetPrincipalDisplayInformation(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @PrincipalId int)
AS
    SET NOCOUNT ON
    BEGIN
        SELECT
            CAST (0 AS bit) AS IsUser,
            CAST (1 AS bit) AS IsSiteGroup,
            NULL AS UserID,
            NULL AS UserSID,
            NULL AS UserName,
            NULL AS UserLogin,
            NULL AS UserEmail,
            NULL AS UserNotes,
            NULL AS UserSiteAdmin,
            NULL AS UserDomainGroup,
            Groups.ID AS GroupID,
            Groups.Title AS GroupName,
            Groups.Description AS GroupDescription,
            Groups.Owner AS GroupOwnerID,
            Groups.OwnerIsUser AS GroupOwnerIsUser,
            CAST (0 AS tinyint) AS GroupType
        FROM
            Groups
        WHERE
            SiteId = @SiteId AND
            Id = @PrincipalId
        IF @@ROWCOUNT = 0
        BEGIN
            SELECT
                CAST (1 AS bit) AS IsUser,
                CAST (0 AS bit) AS IsSiteGroup,
                tp_ID AS UserID,
                tp_SystemID AS UserSID,
                tp_Title AS UserName,
                tp_Login AS UserLogin,
                tp_Email AS UserEmail,
                tp_Notes AS UserNotes,
                tp_SiteAdmin AS UserSiteAdmin,
                tp_DomainGroup AS UserDomainGroup,
                NULL AS GroupID,
                NULL AS GroupName,
                NULL AS GroupDescription,
                NULL AS GroupOwnerID,
                NULL AS GroupOwnerIsUser,
                NULL AS GroupType
            FROM
                UserInfo
            WHERE
                tp_SiteId = @SiteId AND
                tp_Id = @PrincipalId AND
                tp_Deleted = 0
        END
    END

GO
