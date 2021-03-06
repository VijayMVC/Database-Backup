/****** Object:  StoredProcedure [dbo].[proc_SecUpdateUserActiveStatus]    Script Date: 5/15/2018 12:12:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateUserActiveStatus(
    @SiteId uniqueidentifier,
    @UserId int)
AS
    SET NOCOUNT ON
    IF @UserId = 1073741823
        RETURN 0
    DECLARE @OldIsActive bit    
    DECLARE @UserInfoListId uniqueidentifier
    DECLARE @RootWebId uniqueidentifier
    DECLARE @ColName nvarchar(64)
    DECLARE @RowOrdinal int    
    SELECT 
        @UserInfoListId = UserInfoListId,
        @RootWebId = RootWebId,
        @RowOrdinal = UserIsActiveFieldRowOrdinal,
        @ColName = UserIsActiveFieldColumnName
    FROM
        Sites WITH (NOLOCK)
    WHERE
        Id = @SiteId
    SELECT
        @OldIsActive = tp_IsActive
    FROM
        UserInfo
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @UserId AND
        tp_Deleted = 0
    IF @OldIsActive IS NULL
        RETURN 0
    IF @UserInfoListId IS NOT NULL AND
        @ColName IS NOT NULL
    BEGIN
        DECLARE @QueryString nvarchar(1024)
        SET @QueryString = 
        N'UPDATE 
            UserData
        SET ' + @ColName + ' = 1
        WHERE
            tp_ListId = @ListId AND
            tp_ID = @ItemId AND
            tp_Level = 1 AND
            tp_RowOrdinal = @RowOrdinal'
        EXEC sp_executesql @QueryString,
            N'@ListId uniqueidentifier, @ItemId int, @RowOrdinal int',
            @UserInfoListId, @UserId, @RowOrdinal
    END
    UPDATE
        UserInfo
    SET
        tp_IsActive = 1
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @UserId
    IF @OldIsActive = 0
    BEGIN
        EXEC proc_LogChange @SiteId, NULL, NULL, @UserId, NULL, NULL, @UserId,
            NULL, 8192, 128, NULL
    END    
    RETURN 0

GO
