/****** Object:  StoredProcedure [dbo].[proc_GetSiteProps]    Script Date: 5/15/2018 12:12:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetSiteProps(
    @WebSiteId uniqueidentifier
)
AS
    SET NOCOUNT ON
    SELECT 
        OwnerID,
        SecondaryContactID,
        PortalURL,
        PortalName,
        LastContentChange,
        LastSecurityChange
    FROM
        Sites
    WHERE
        Id = @WebSiteId
    RETURN 0

GO
