/****** Object:  StoredProcedure [dbo].[proc_SecGetPrincipalDisplayInformation20]    Script Date: 5/15/2018 12:12:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetPrincipalDisplayInformation20(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @PrincipalId01 int,
    @PrincipalId02 int,
    @PrincipalId03 int,
    @PrincipalId04 int,
    @PrincipalId05 int,
    @PrincipalId06 int,
    @PrincipalId07 int,
    @PrincipalId08 int,
    @PrincipalId09 int,
    @PrincipalId10 int,
    @PrincipalId11 int,
    @PrincipalId12 int,
    @PrincipalId13 int,
    @PrincipalId14 int,
    @PrincipalId15 int,
    @PrincipalId16 int,
    @PrincipalId17 int,
    @PrincipalId18 int,
    @PrincipalId19 int,
    @PrincipalId20 int)
AS
    SET NOCOUNT ON
    IF @PrincipalId01 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId01
    IF @PrincipalId02 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId02
    IF @PrincipalId03 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId03
    IF @PrincipalId04 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId04
    IF @PrincipalId05 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId05
    IF @PrincipalId06 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId06
    IF @PrincipalId07 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId07
    IF @PrincipalId08 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId08
    IF @PrincipalId09 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId09
    IF @PrincipalId10 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId10
    IF @PrincipalId11 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId11
    IF @PrincipalId12 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId12
    IF @PrincipalId13 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId13
    IF @PrincipalId14 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId14
    IF @PrincipalId15 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId15
    IF @PrincipalId16 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId16
    IF @PrincipalId17 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId17
    IF @PrincipalId18 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId18
    IF @PrincipalId19 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId19
    IF @PrincipalId20 IS NOT NULL
        EXEC proc_SecGetPrincipalDisplayInformation @SiteId, @WebId, @PrincipalId20

GO
