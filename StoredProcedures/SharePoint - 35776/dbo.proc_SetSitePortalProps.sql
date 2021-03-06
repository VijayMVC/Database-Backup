/****** Object:  StoredProcedure [dbo].[proc_SetSitePortalProps]    Script Date: 5/15/2018 12:12:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetSitePortalProps(
    @WebSiteId  uniqueidentifier,
    @SitePortalURL nvarchar(260),
    @SitePortalName nvarchar(255))
AS
    SET NOCOUNT ON
    UPDATE
        Sites
    SET 
        PortalURL = @SitePortalURL,
        PortalName = @SitePortalName
    WHERE
        Id = @WebSiteId
    IF @@ROWCOUNT = 1
    BEGIN
        EXEC proc_LogChange @WebSiteId, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, 8192,  8, NULL
        RETURN 0
    END
    ELSE
    BEGIN
        RETURN 3
    END

GO
