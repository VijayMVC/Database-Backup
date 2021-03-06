/****** Object:  StoredProcedure [dbo].[proc_DeplExportGroups]    Script Date: 5/15/2018 12:11:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplExportGroups(
    @SiteId uniqueidentifier,
    @GroupIdCur int)
AS
    SET NOCOUNT ON
    DECLARE @GID int
    SELECT TOP 1
        @GID = ID
    FROM
        Groups
    WHERE
        SiteId = @SiteId AND Id > @GroupIdCur
    ORDER BY
        SiteId, Id
    SELECT
        ID, Title, Description, Owner, OwnerIsUser, RequestEmail, Flags
    FROM
        Groups
    WHERE
        SiteId = @SiteId AND Id = @GID
    SELECT
        MemberId
    FROM
        GroupMembership
    WHERE
        SiteId = @SiteId AND GroupId = @GID
    ORDER BY
        MemberId

GO
