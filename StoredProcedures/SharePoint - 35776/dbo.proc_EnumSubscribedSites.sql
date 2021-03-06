/****** Object:  StoredProcedure [dbo].[proc_EnumSubscribedSites]    Script Date: 5/15/2018 12:11:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EnumSubscribedSites(
@NotifyFreq         int, 
@bAlwaysNotify   bit)
AS
    SET NOCOUNT ON
    IF (@bAlwaysNotify = 0)
    BEGIN
        SELECT
            SchedSites.SiteId
        FROM
        (SELECT DISTINCT
            EventLog.SiteId AS SiteId
        FROM
            EventLog WITH (NOLOCK)) AS EventSites
        INNER MERGE JOIN
        (SELECT DISTINCT
            SchedSubscriptions.SiteId AS SiteId
        FROM
            SchedSubscriptions WITH (NOLOCK)
        WHERE
            NotifyFreq = @NotifyFreq) AS SchedSites
        ON
            EventSites.SiteId = SchedSites.SiteId
    END
    ELSE
    BEGIN
        SELECT DISTINCT
            SiteId 
        FROM 
            SchedSubscriptions WITH (NOLOCK)
        WHERE
            AlertType & 1073741824 = 1073741824 AND
            NotifyFreq=@NotifyFreq    
    END
    RETURN 0

GO
