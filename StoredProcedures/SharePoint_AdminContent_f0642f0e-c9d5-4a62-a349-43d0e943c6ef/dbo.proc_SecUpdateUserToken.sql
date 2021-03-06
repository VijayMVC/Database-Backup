/****** Object:  StoredProcedure [dbo].[proc_SecUpdateUserToken]    Script Date: 5/15/2018 12:12:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateUserToken(
    @SiteId uniqueidentifier,
    @UserId int)
AS
    SET NOCOUNT ON
    DECLARE @ptr        binary(16)
    DECLARE @groupCount int
    DECLARE @groupId    int
    DECLARE @binary4    binary(4)
    DECLARE @binary8    binary(8)
    IF NOT EXISTS (
        SELECT
            *
        FROM 
            GroupMembership 
        WHERE
            SiteId  = @SiteId AND
            MemberID = @UserId 
    )
    BEGIN
        UPDATE 
            UserInfo
        SET 
            tp_Token = NULL
        WHERE        
            tp_SiteId = @SiteId AND
            tp_ID = @UserId
        RETURN 0
    END
    SET @groupCount = 0
    SET @binary4 = dbo.fn_ChangeEndian4(0xdcd3)
    BEGIN TRAN
    UPDATE 
        UserInfo
    SET 
        tp_Token = @binary4
    WHERE        
        tp_SiteId = @SiteId AND
        tp_ID = @UserId
    SELECT 
        @ptr = TEXTPTR(tp_Token) 
    FROM 
        UserInfo (UPDLOCK) 
    WHERE 
        tp_SiteId = @SiteId AND
        tp_ID = @UserId
    UPDATETEXT UserInfo.tp_Token @ptr 0 NULL @binary4       
    SET @binary8 = dbo.fn_ChangeEndian4(1)
    UPDATETEXT UserInfo.tp_Token @ptr NULL NULL @binary8    
    SET @binary4 = 0x00000000
    UPDATETEXT UserInfo.tp_Token @ptr NULL NULL @binary4    
    DECLARE cur CURSOR FOR SELECT GroupID
    FROM 
        GroupMembership 
    WHERE
        SiteId  = @SiteId AND
        MemberID = @UserId
    ORDER BY
        GroupID
    OPEN cur
    FETCH NEXT FROM cur INTO @groupId
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        SET @binary4 = dbo.fn_ChangeEndian4(@groupId)
        UPDATETEXT UserInfo.tp_Token @ptr NULL NULL @binary4
        SET @groupCount = @groupCount + 1
        FETCH NEXT FROM cur INTO @groupId
    END
    CLOSE cur
    DEALLOCATE cur
    SET @binary4 = dbo.fn_ChangeEndian4(@groupCount)
    UPDATETEXT UserInfo.tp_Token @ptr 12 4 @binary4
    COMMIT TRAN
    RETURN 0

GO
