/****** Object:  UserDefinedFunction [dbo].[fn_GetSiteLogoDescription]    Script Date: 5/15/2018 12:15:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetSiteLogoDescription(@LogoDescription nvarchar(255),@RootWebId uniqueidentifier)
RETURNS nvarchar(255)
AS
BEGIN
    DECLARE @Description nvarchar(255)
    IF @LogoDescription IS NULL
    BEGIN
        SELECT @Description=Webs.SiteLogoDescription
        FROM Webs WITH(NOLOCK)
        WHERE Webs.Id=@RootWebId
    END
    ELSE
    BEGIN
       SET @Description = @LogoDescription 
    END
    RETURN @Description
END

GO
