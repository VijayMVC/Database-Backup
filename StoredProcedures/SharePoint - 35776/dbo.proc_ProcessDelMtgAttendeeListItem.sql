/****** Object:  StoredProcedure [dbo].[proc_ProcessDelMtgAttendeeListItem]    Script Date: 5/15/2018 12:12:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ProcessDelMtgAttendeeListItem
(
    @SiteId     uniqueidentifier,
    @WebId      uniqueidentifier,
    @ListId     uniqueidentifier,
    @ItemId     int
)
AS
    SET NOCOUNT ON
    DECLARE @AttendeeId int
    SELECT
        @AttendeeId = int1
    FROM
        UserData
    WHERE
        tp_ListId = @ListId AND
        tp_Id = @ItemId    AND
        tp_RowOrdinal = 0
    IF @@ROWCOUNT = 0
        RETURN 13
    IF @AttendeeId IS NOT NULL
    BEGIN
        IF NOT EXISTS (
            SELECT
                *
            FROM
                UserData
            WHERE
                tp_ListId = @ListId AND
                int1 = @AttendeeId AND
                tp_Id <> @ItemId AND
                tp_RowOrdinal = 0
            )
        BEGIN
            DECLARE @ContributorGroupID int
            SET @ContributorGroupID = 1073741824 + 3
            DECLARE @ScopeId uniqueidentifier
            DECLARE @RoleDefWebId uniqueidentifier
            SELECT 
                @ScopeId = ScopeId
            FROM
                Webs
            WHERE
                Id = @WebId
            SELECT
                @RoleDefWebId = RoleDefWebId
            FROM
                Perms
            WHERE
                SiteId = @SiteId AND
                ScopeId = @ScopeId AND
                WebId   = @WebId
            IF @RoleDefWebId IS NOT NULL
                EXEC proc_SecRemovePrincipalFromScope
                    @SiteId,
                    @WebId,
                    @ScopeId,
                    @ScopeId,
                    @AttendeeId,
                    @ContributorGroupID
        END
    END

GO
