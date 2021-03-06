/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_GetSiteId]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_GetSiteId
 @siteGuid uniqueidentifier,
 @isSspLevel bit
AS

    IF (@isSspLevel = 1)
        RETURN NULL

    DECLARE @siteId int
    SELECT @siteId = siteId FROM MSSQLogSiteGuid WHERE siteGuid = @siteGuid
    RETURN @siteId

GO
