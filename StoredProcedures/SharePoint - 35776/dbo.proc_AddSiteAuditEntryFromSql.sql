/****** Object:  StoredProcedure [dbo].[proc_AddSiteAuditEntryFromSql]    Script Date: 5/15/2018 12:11:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddSiteAuditEntryFromSql(
    @SiteId             uniqueidentifier,
    @UserId             int,
    @Event              int,
    @EventData          ntext = NULL,
    @EventFlag          int)
AS
    SET NOCOUNT ON
    DECLARE @DirName    nvarchar(256)
    SELECT TOP 1
        @DirName = FullUrl
    FROM
        Webs
    WHERE
        Webs.SiteId = @SiteId AND
        Webs.ParentWebId IS NULL
    EXEC proc_AddAuditEntryFromSql
                @SiteId,
                @DirName,
                N'',
                7,
                @UserId,
                @Event,
                @EventData,
                @EventFlag

GO
