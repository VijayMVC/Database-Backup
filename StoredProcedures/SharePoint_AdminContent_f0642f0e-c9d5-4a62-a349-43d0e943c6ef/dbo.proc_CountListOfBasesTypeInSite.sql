/****** Object:  StoredProcedure [dbo].[proc_CountListOfBasesTypeInSite]    Script Date: 5/15/2018 12:12:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_CountListOfBasesTypeInSite(
    @SiteId uniqueidentifier,
    @BaseTypes int)
AS
    SET NOCOUNT ON
    DECLARE @cList int
    IF @BaseTypes = 0 RETURN 0
    SELECT
        @cList = COUNT(*)
    FROM
        Lists
    JOIN
	Webs
    ON
	Webs.Id = Lists.tp_WebId AND
	Webs.SiteId = @SiteId
    WHERE
        tp_BaseType < 31 AND
        (POWER(2, tp_BaseType) & @BaseTypes) <> 0
    RETURN ISNULL(@cList, 0)

GO
