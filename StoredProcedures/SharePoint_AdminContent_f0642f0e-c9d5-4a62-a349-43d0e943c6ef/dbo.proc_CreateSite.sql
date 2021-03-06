/****** Object:  StoredProcedure [dbo].[proc_CreateSite]    Script Date: 5/15/2018 12:12:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateSite(
    @SiteId                     uniqueidentifier,
    @DirName                    nvarchar(256),
    @LeafName                   nvarchar(128),
    @RootWebUrl                 nvarchar(256),
    @Language                   int,
    @Collation                  smallint,
    @CalendarType               smallint,
    @Time24                     bit,
    @OwnerSID                   tSystemID,
    @OwnerLogin                 nvarchar(255),
    @OwnerName                  nvarchar(255),
    @OwnerEmail                 nvarchar(255),
    @SecondaryContactSID        tSystemID,
    @SecondaryContactLogin      nvarchar(255),
    @SecondaryContactName       nvarchar(255),
    @SecondaryContactEmail      nvarchar(255),
    @AdminsName                 nvarchar(255),
    @AdminsDescription          nvarchar(512),
    @AdminsPermMask             tPermMask,
    @AuthorsName                nvarchar(255),
    @AuthorsDescription         nvarchar(512),
    @AuthorsPermMask            tPermMask,
    @ContributorsName           nvarchar(255),
    @ContributorsDescription    nvarchar(512),
    @ContributorsPermMask       tPermMask,
    @BrowsersName               nvarchar(255),
    @BrowsersDescription        nvarchar(512),
    @BrowsersPermMask           tPermMask,
    @GuestsName                 nvarchar(255),
    @GuestsDescription          nvarchar(512),
    @GuestsPermMask             tPermMask,
    @SiteHashKey                binary(16),
    @HostHeader                 nvarchar(260))
AS
    SET NOCOUNT ON
    DECLARE @Now                  datetime
    DECLARE @SecondaryContactId   int
    DECLARE @RootWebId            uniqueidentifier
    DECLARE @iRet                 int
    DECLARE @DocId                uniqueidentifier
    DECLARE @ScopeRoot            uniqueidentifier
    DECLARE @Ret                  int
    SET @Ret = 1359
    BEGIN TRAN
    SELECT @RootWebId = NEWID()
    INSERT INTO UserInfo (
        tp_SiteID,
        tp_ID,
        tp_DomainGroup,
        tp_SystemID,
        tp_Deleted,
        tp_Login,
        tp_Title,
        tp_Email,
        tp_SiteAdmin,
        tp_IsActive,
        tp_Notes)
    VALUES (
        @SiteId,
        1,
        0,
        @OwnerSID,
        0,
        @OwnerLogin,
        @OwnerName,
        @OwnerEmail,
        1,
        1,
        N'')
    IF @SecondaryContactSID IS NOT NULL AND @SecondaryContactSID <> @OwnerSID
    BEGIN
        SET @SecondaryContactId = 2
        INSERT INTO UserInfo (
            tp_SiteID,
            tp_ID,
            tp_DomainGroup,
            tp_SystemID,
            tp_Deleted,
            tp_Login,
            tp_Title,
            tp_Email,
            tp_SiteAdmin,
            tp_IsActive,
            tp_Notes)
        VALUES (
            @SiteId,
            @SecondaryContactId,
            0,
            @SecondaryContactSID,
            0,
            @SecondaryContactLogin,
            @SecondaryContactName,
            @SecondaryContactEmail,
            1,
            1,
            N'')
    END
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())    
    INSERT INTO Sites (
        Id,
        NextUserOrGroupId,
        OwnerID,
        SecondaryContactID,
        CertificationDate,
        TimeCreated,
        HashKey,
        RootWebId,
        UserInfoListId,
        HostHeader)
    VALUES (
        @SiteId,
        3,
        1,
        @SecondaryContactId,
        @Now,
        @Now,
        @SiteHashKey,
        @RootWebId,
        NULL,
        @HostHeader)
    IF ( @@ROWCOUNT <> 1 )
    BEGIN
        SET @Ret = 80
        GOTO cleanup
    END
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        4096,  8, @Now
    EXEC proc_LogChange @SiteId, NULL, NULL, 1, NULL, NULL, 1, NULL,
        4096, 128, @Now
    IF @SecondaryContactId IS NOT NULL
    BEGIN
        EXEC proc_LogChange @SiteId, NULL, NULL, @SecondaryContactId, NULL, NULL,
            @SecondaryContactId, NULL, 4096,
            128, @Now
    END
    SELECT @ScopeRoot = NEWID()
    EXEC proc_SecAddPermScopeForWeb @SiteId, @ScopeRoot, @RootWebId, @RootWebId, 0, @RootWebUrl
    INSERT INTO Webs (
        Id,
        SiteId,
        FullUrl,
        ParentWebId,
        ProductVersion,
        TemplateVersion,
        FirstUniqueAncestorWebId,
        Author,
        TimeCreated,
        MetaInfoVersion,
        DailyUsageDataVersion,
        MonthlyUsageDataVersion,
        DayLastAccessed,
        WebTemplate,
        Language,
        Locale,
        Collation,
        TimeZone,
        CalendarType,
        Time24,
        AltCalendarType,
        CalendarViewOptions,
        WorkDays,
        WorkDayStartHour,
        WorkDayEndHour,
        MeetingCount,
        NavStructNextEid,
        NavParentWebId,
        NextWebGroupId,
        ProvisionConfig,
        Flags,
        ScopeId,
        RequestAccessEmail)
    VALUES (
        @RootWebId,
        @SiteId,
        @RootWebUrl,
        NULL,
        3,
        0,
        @RootWebId,
        1,
        @Now,
        0,
        0,
        0,
        0,
        0x1,  
        @Language,
        @Language, 
        @Collation,
        0,
        @CalendarType,
        @Time24,
        NULL, 
        NULL,
        NULL,
        NULL,
        NULL,
        0,
        2001, 
        NULL, 
        1073741824 + 100,
        -1,  
        (0 | 0x01 | 0x02 | 0x20 | 0x100),
        @ScopeRoot,
        @OwnerEmail)
    SET @DocId = NEWID()
    EXEC proc_LogChange @SiteId, @RootWebId, NULL, NULL, NULL, NULL, NULL,
        NULL, 4096,  4, @Now
    INSERT INTO AllDocs (
        Id,
        ParentId,
        SiteId,
        DirName,
        LeafName,
        WebId,
        Type,
        TimeCreated,
        TimeLastModified,
        ScopeId)
    VALUES (
        @DocId,
        0x,
        @SiteId,
        @DirName, 
        @LeafName, 
        @RootWebId,
        2,
        @Now,
        @Now,
        @ScopeRoot)
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
        @SiteId, 152, 1
    EXEC proc_CreateWebNavStruct @SiteId, @RootWebId
    EXEC proc_ProvisionWeb @SiteId, @RootWebId, @RootWebUrl
    EXEC proc_CreateDefaultRoles @SiteId, @RootWebId, @ScopeRoot,
        1, @SecondaryContactId,
        @AdminsName, @AdminsDescription, @AdminsPermMask,
        @AuthorsName,@AuthorsDescription, @AuthorsPermMask,
        @ContributorsName,@ContributorsDescription, @ContributorsPermMask,
        @BrowsersName, @BrowsersDescription, @BrowsersPermMask,
        @GuestsName, @GuestsDescription, @GuestsPermMask            
    IF (@SecondaryContactId = 2)
    BEGIN
        UPDATE Sites SET UsersCount = 2 WHERE Id = @SiteId
    END
    SET @Ret = 0
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
