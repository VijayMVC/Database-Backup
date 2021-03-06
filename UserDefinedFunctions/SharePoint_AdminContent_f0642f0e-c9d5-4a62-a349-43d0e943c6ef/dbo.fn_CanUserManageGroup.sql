/****** Object:  UserDefinedFunction [dbo].[fn_CanUserManageGroup]    Script Date: 5/15/2018 12:15:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_CanUserManageGroup(
    @SiteId uniqueidentifier,
    @UserId int,
    @SiteAdmin bit,
    @GroupId int,
    @GroupOwnerId   int,
    @CurrentUserIsOwner bit)
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
    IF @CurrentUserIsOwner = 1 AND EXISTS (
        SELECT
            *
        FROM
            Groups
        WHERE
            ID = @GroupId AND
            SiteId = @SiteId AND
            Owner = @GroupOwnerId)
        RETURN 1
    RETURN 0
END

GO
