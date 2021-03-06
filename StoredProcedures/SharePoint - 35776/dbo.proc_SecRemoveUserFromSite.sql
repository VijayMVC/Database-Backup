/****** Object:  StoredProcedure [dbo].[proc_SecRemoveUserFromSite]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemoveUserFromSite(
    @SiteId uniqueidentifier,
    @NewSiteGroupOwnerId int,
    @UserId int)
AS
    SET NOCOUNT ON
    DECLARE @IsDomainGroup bit
    SELECT 
        @IsDomainGroup = tp_DomainGroup
    FROM
        UserInfo
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID     = @UserId
    DECLARE @SiteOwnerId        int
    DECLARE @SecondaryContactId int
    SELECT
        @SiteOwnerId        = OwnerID,
        @SecondaryContactId = SecondaryContactID
    FROM
        Sites
    WHERE
        ID = @SiteId
    IF @UserId = @SiteOwnerId OR 
        @UserId = @SecondaryContactId
            RETURN 4335
    IF @NewSiteGroupOwnerId = @UserId
        RETURN 16      
    IF @NewSiteGroupOwnerId = -1
    BEGIN
        SELECT
            @NewSiteGroupOwnerId = OwnerID
        FROM
            Sites
        WHERE
            Id = @SiteId
    END
    BEGIN TRAN
    UPDATE
        Groups
    SET
        Owner = @NewSiteGroupOwnerId
    WHERE
        SiteID = @SiteId AND
        Owner = @UserId
    UPDATE
        UserInfo
    SET
        tp_Deleted = tp_ID,
        tp_SiteAdmin = 0,
        tp_IsActive = 0,
        tp_Locale = NULL,
        tp_CalendarType = NULL,
        tp_AdjustHijriDays = NULL,
        tp_TimeZone = NULL,
        tp_Time24 = NULL,
        tp_AltCalendarType = NULL,
        tp_CalendarViewOptions = NULL,
        tp_WorkDays = NULL,
        tp_WorkDayStartHour = NULL,
        tp_WorkDayEndHour = NULL,
        tp_Token = NULL
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID = @UserId
    DELETE FROM
        GroupMembership
    WHERE
        SiteID = @SiteID AND
        MemberID = @UserId
    EXEC proc_SecRemovePrincipalFromAllAcls @SiteId, @UserId
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, @UserId, NULL,
        16384, 128, NULL
    IF @IsDomainGroup <> 1
    BEGIN
        DELETE WebMembers FROM
            WebMembers, Webs
        WHERE
            WebMembers.WebID = Webs.Id AND
            Webs.SiteId = @SiteId AND
            WebMembers.UserId = @UserId
        DELETE FROM
            Personalization
        WHERE
            tp_SiteId = @SiteId AND
            tp_UserID = @UserId
        DELETE FROM
            WebParts
        WHERE
            tp_SiteId = @SiteId AND
            tp_UserId = @UserId
        DELETE FROM
            EventSubsMatches 
        WHERE
            SubId 
        IN (
            SELECT Id FROM
                ImmedSubscriptions
            WHERE
                SiteId = @SiteId AND
                UserId = @UserId
            UNION
            SELECT Id FROM 
                SchedSubscriptions
            WHERE
                SiteId = @SiteId AND
                UserId = @UserId)
        DELETE FROM
            ImmedSubscriptions
        WHERE
            SiteId = @SiteId AND
            UserId = @UserId
        DELETE FROM
            SchedSubscriptions
        WHERE
            SiteId = @SiteId AND
            UserId = @UserId
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 0
    END
    ELSE
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 1
    COMMIT TRAN

GO
