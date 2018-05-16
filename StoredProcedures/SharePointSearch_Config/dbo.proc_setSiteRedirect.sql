/****** Object:  StoredProcedure [dbo].[proc_setSiteRedirect]    Script Date: 5/15/2018 12:13:07 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_setSiteRedirect
(   
    @SiteId uniqueidentifier,
    @RedirectUrl nvarchar(512)
) AS
    SET NOCOUNT ON
    UPDATE
        SiteMap
    SET
        RedirectUrl = @RedirectUrl
    WHERE
        Id = @SiteId

GO
