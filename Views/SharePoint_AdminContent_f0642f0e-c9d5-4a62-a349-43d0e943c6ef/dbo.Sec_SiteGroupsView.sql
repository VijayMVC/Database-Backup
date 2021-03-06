/****** Object:  View [dbo].[Sec_SiteGroupsView]    Script Date: 5/15/2018 12:14:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Sec_SiteGroupsView]
AS
    SELECT
        G1.ID,
        G1.Title,
        G1.Description,
        G1.SiteID AS SiteWebId,
        G1.Owner,
        G1.OwnerIsUser,
        CAST (0 AS bit) AS OwnerGlobal,
        CAST (0 as tinyint) AS Type,
        CAST (1 as bit) AS Global,
        G1.SiteID,
        UserInfo.tp_ID AS UserID,
        UserInfo.tp_SystemID AS UserSID,
        UserInfo.tp_Title AS UserName,
        UserInfo.tp_Login AS UserLogin,
        UserInfo.tp_Email AS UserEmail,
        UserInfo.tp_Notes AS UserNotes,
        UserInfo.tp_SiteAdmin AS UserSiteAdmin,
        UserInfo.tp_DomainGroup AS UserDomainGroup,
        NULL AS GroupID,
        NULL AS GroupName,
        NULL AS GroupDescription,
        NULL AS GroupSiteID,
        NULL AS GroupOwner,
        NULL AS GroupOwnerIsUser,
        G1.DLAlias,
        G1.DLErrorMessage,
        G1.DLFlags,
        G1.DLJobId,
        G1.DLArchives,
        G1.RequestEmail,
        G1.Flags
    FROM
        Groups G1
    INNER JOIN
        UserInfo
    ON
        G1.Owner = UserInfo.tp_ID AND
        G1.SiteId = UserInfo.tp_SiteID
    WHERE
        G1.OwnerIsUser = 1
    UNION ALL
    SELECT
        G1.ID,
        G1.Title,
        G1.Description,
        G1.SiteID AS WebId,
        G1.Owner,
        G1.OwnerIsUser,
        CAST (1 AS bit) AS OwnerGlobal,
        CAST (0 AS tinyint) AS Type,
        CAST (1 AS bit) AS Global,
        G1.SiteID,
        NULL AS UserID,
        NULL AS UserSID,
        NULL AS UserName,
        NULL AS UserLogin,
        NULL AS UserEmail,
        NULL AS UserNotes,
        NULL AS UserSiteAdmin,
        NULL AS UserDomainGroup,
        G2.ID AS GroupID,
        G2.Title AS GroupName,
        G2.Description AS GroupDescription,
        G2.SiteID AS GroupSiteID,
        G2.Owner AS GroupOwner,
        G2.OwnerIsUser AS GroupOwnerIsUser,
        G1.DLAlias,
        G1.DLErrorMessage,
        G1.DLFlags,
        G1.DLJobId,
        G1.DLArchives,
        G1.RequestEmail,
        G1.Flags
    FROM
        Groups G1
    INNER JOIN
        Groups G2
    ON
        G1.Owner = G2.ID AND
        G1.SiteId = G2.SiteId
    WHERE
        G1.OwnerIsUser = 0

GO
