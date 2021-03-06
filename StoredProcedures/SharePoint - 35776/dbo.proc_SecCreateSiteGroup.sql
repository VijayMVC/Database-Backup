/****** Object:  StoredProcedure [dbo].[proc_SecCreateSiteGroup]    Script Date: 5/15/2018 12:12:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecCreateSiteGroup(
    @SiteId uniqueidentifier,
    @Title nvarchar(255),
    @Description nvarchar(512),
    @OwnerID int,
    @OwnerIsUser bit,
    @FirstMemberId int,
    @UseExisting bit,
    @SelfOwner bit,
    @GroupID int OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @GroupIdLocal int
    IF (@UseExisting = 1)
    BEGIN
        SELECT 
            @GroupIdLocal = ID
        FROM
            Groups
        WHERE
            SiteID = @SiteId AND
            Title = @Title
        IF (@GroupIdLocal IS NOT NULL)
        BEGIN
            SET @GroupId = @GroupIdLocal
            RETURN 0
        END
    END
    EXEC @GroupID = proc_SecGetSitePrincipalId @SiteId
    DECLARE @GroupCount      int
    SELECT 
        @GroupCount = COUNT(*)
    FROM
        Groups
    WHERE
        SiteID = @SiteId
    BEGIN TRAN
    IF (@SelfOwner = 1)
    BEGIN
        SET @OwnerId = @GroupId
        SET @OwnerIsUser = 0
    END
    INSERT INTO Groups(
        SiteID,
        ID,
        Title,
        Description,
        Owner,
        OwnerIsUser,
        Flags)
    VALUES(
        @SiteId,
        @GroupID,
        @Title,
        @Description,
        @OwnerID,
        @OwnerIsUser,
        1)
    IF 0 <> @@ERROR
    BEGIN
        RETURN 80
    END
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, @GroupId,
        NULL, 4096, 256, NULL
    IF (@OwnerIsUser = 1)
    BEGIN
        EXEC proc_SecUpdateUserActiveStatus @SiteId, @OwnerID
    END
    IF (@FirstMemberID IS NOT NULL)
    BEGIN
        INSERT INTO GroupMembership(
            SiteID,
            GroupID,
            MemberID)
        VALUES(
            @SiteId,
            @GroupID,
            @FirstMemberID)
        EXEC proc_SecUpdateUserToken @SiteId, @FirstMemberID
        EXEC proc_SecUpdateUserActiveStatus @SiteId, @FirstMemberID
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 0
    END
    COMMIT TRAN
    DECLARE @data nvarchar(255)
    SET @data = N'<title>' + @Title + N'</title><groupid>' + 
                CONVERT(nvarchar(64), @GroupId) + N'</groupid><user>' + 
                CONVERT(nvarchar(64), @FirstMemberID) + N'</user>'
    EXEC proc_AddSiteAuditEntryFromSql 
        @SiteID, 
        @OwnerID, 
        30,
        @data,
        0x00000100
    RETURN 0

GO
