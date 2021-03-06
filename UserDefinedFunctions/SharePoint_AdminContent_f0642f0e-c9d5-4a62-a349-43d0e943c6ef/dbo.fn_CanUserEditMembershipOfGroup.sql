/****** Object:  UserDefinedFunction [dbo].[fn_CanUserEditMembershipOfGroup]    Script Date: 5/15/2018 12:15:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_CanUserEditMembershipOfGroup(
    @SiteId uniqueidentifier,
    @UserId int,
    @SiteAdmin bit,
    @GroupId int,
    @BelongsToGroup bit, 
    @GroupOwnerId int,
    @CurrentUserIsOwner bit,
    @UserIdToAddOrRemove int)
RETURNS bit
AS
BEGIN
    DECLARE @SiteFlags int
    SELECT
        @SiteFlags = BitFlags
    FROM
        Sites
    IF @SiteFlags & 131072 = 131072
        RETURN 0
    IF @SiteAdmin = 1
        RETURN 1
    IF dbo.fn_CanUserManageGroup(@SiteId, @UserId, @SiteAdmin, @GroupId, @GroupOwnerId, @CurrentUserIsOwner) = 1
        RETURN 1
    DECLARE @Flags int
    SELECT
        @Flags = Flags
    FROM
        Groups
    WHERE
        SiteId = @SiteId AND
        ID = @GroupId
    IF @Flags IS NOT NULL
    BEGIN
        IF (@Flags & 2) <> 0 AND        
            @BelongsToGroup = 1
            RETURN 1
        IF (@Flags & 4) <> 0 AND
            (@Flags & 8) <> 0 AND
            @UserId = @UserIdToAddOrRemove
            RETURN 1
    END
    RETURN 0
END    

GO
