/****** Object:  StoredProcedure [dbo].[proc_SecGetSiteGroupByTitle20]    Script Date: 5/15/2018 12:12:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetSiteGroupByTitle20(
    @SiteId uniqueidentifier,
    @PrincipalId01 nvarchar(255),
    @PrincipalId02 nvarchar(255),
    @PrincipalId03 nvarchar(255),
    @PrincipalId04 nvarchar(255),
    @PrincipalId05 nvarchar(255),
    @PrincipalId06 nvarchar(255),
    @PrincipalId07 nvarchar(255),
    @PrincipalId08 nvarchar(255),
    @PrincipalId09 nvarchar(255),
    @PrincipalId10 nvarchar(255),
    @PrincipalId11 nvarchar(255),
    @PrincipalId12 nvarchar(255),
    @PrincipalId13 nvarchar(255),
    @PrincipalId14 nvarchar(255),
    @PrincipalId15 nvarchar(255),
    @PrincipalId16 nvarchar(255),
    @PrincipalId17 nvarchar(255),
    @PrincipalId18 nvarchar(255),
    @PrincipalId19 nvarchar(255),
    @PrincipalId20 nvarchar(255))
AS
    SET NOCOUNT ON
    IF @PrincipalId01 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId01
    IF @PrincipalId02 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId02
    IF @PrincipalId03 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId03
    IF @PrincipalId04 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId04
    IF @PrincipalId05 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId05
    IF @PrincipalId06 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId06
    IF @PrincipalId07 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId07
    IF @PrincipalId08 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId08
    IF @PrincipalId09 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId09
    IF @PrincipalId10 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId10
    IF @PrincipalId11 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId11
    IF @PrincipalId12 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId12
    IF @PrincipalId13 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId13
    IF @PrincipalId14 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId14
    IF @PrincipalId15 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId15
    IF @PrincipalId16 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId16
    IF @PrincipalId17 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId17
    IF @PrincipalId18 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId18
    IF @PrincipalId19 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId19
    IF @PrincipalId20 IS NOT NULL
        EXEC proc_SecGetSiteGroupByTitle @SiteId, @PrincipalId20

GO
