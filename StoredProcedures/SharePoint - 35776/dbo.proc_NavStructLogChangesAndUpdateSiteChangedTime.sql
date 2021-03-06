/****** Object:  StoredProcedure [dbo].[proc_NavStructLogChangesAndUpdateSiteChangedTime]    Script Date: 5/15/2018 12:12:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructLogChangesAndUpdateSiteChangedTime(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @TimeLastModifiedIncoming datetime
    )
AS
    EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, NULL, NULL, NULL,
        NULL, 134217728,  4, @TimeLastModifiedIncoming
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, 0, 1
    RETURN 0

GO
