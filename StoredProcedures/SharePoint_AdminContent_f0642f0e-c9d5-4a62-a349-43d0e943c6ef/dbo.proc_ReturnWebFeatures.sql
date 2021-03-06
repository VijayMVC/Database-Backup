/****** Object:  StoredProcedure [dbo].[proc_ReturnWebFeatures]    Script Date: 5/15/2018 12:12:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ReturnWebFeatures(
    @DocSiteId   uniqueidentifier,
    @Webs_Id     uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @ret int
    EXEC @ret = proc_GetWebFeatureList
        @DocSiteId, '00000000-0000-0000-0000-000000000000'
    IF (@ret <> 0)
    BEGIN
        RETURN @ret
    END
    EXEC @ret = proc_GetWebFeatureList
        @DocSiteId, @Webs_Id
    IF (@ret <> 0)
    BEGIN
        RETURN @ret
    END
    RETURN @ret

GO
