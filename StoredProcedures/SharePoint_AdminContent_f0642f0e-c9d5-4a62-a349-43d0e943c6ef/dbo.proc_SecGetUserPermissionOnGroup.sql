/****** Object:  StoredProcedure [dbo].[proc_SecGetUserPermissionOnGroup]    Script Date: 5/15/2018 12:12:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetUserPermissionOnGroup(
    @SiteId uniqueidentifier,
    @GroupId int,
    @UserId int,
    @BelongsToGroup bit,
    @CanViewMembership bit OUTPUT,
    @CanEditMembership bit OUTPUT,
    @GroupOwnerId int OUTPUT,
    @IsExplicitlyInMembership bit OUTPUT)
AS
    SET @CanViewMembership = 0
    SET @CanEditMembership = 0
    SET @GroupOwnerId = -1
    DECLARE @Flags int
    SELECT
        @Flags = Flags,
        @GroupOwnerId = Owner
    FROM
        Groups
    WHERE
        SiteId = @SiteId AND
        ID = @GroupId
    IF @Flags IS NULL
        RETURN 1319
    IF (@Flags & 1) <> 0
    BEGIN
        SET @CanViewMembership = @BelongsToGroup
    END
    ELSE
    BEGIN
        SET @CanViewMembership = 1
    END
    IF (@Flags & 2) <> 0
    BEGIN
        SET @CanEditMembership = @BelongsToGroup
    END
    ELSE
    BEGIN
        SET @CanEditMembership = 0
    END
    IF EXISTS (
        SELECT
            *
        FROM
            GroupMembership
        WHERE
            SiteId = @SiteId AND
            GroupId = @GroupId AND
            MemberID = @UserId )
    BEGIN
        SET @IsExplicitlyInMembership = 1
    END
    ELSE
    BEGIN
        SET @IsExplicitlyInMembership = 0
    END
    RETURN 0

GO
