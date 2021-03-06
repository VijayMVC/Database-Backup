/****** Object:  StoredProcedure [dbo].[proc_CreateMtgInstSubFoldersForDocLib]    Script Date: 5/15/2018 12:11:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateMtgInstSubFoldersForDocLib
(
    @SiteId         uniqueidentifier,
    @WebId          uniqueidentifier,
    @DocLibUrl      nvarchar(256),
    @ListFlags      bigint,
    @PreservePast   bit = 1
)
AS
    SET NOCOUNT ON
    IF @ListFlags IS NULL
        RETURN 13
    IF (@ListFlags & 0x20) = 0
        RETURN 0
    DECLARE @Instances_cursor CURSOR
    DECLARE @NoMeetings bit
    DECLARE @Error int
    EXEC @Error = proc_MtgInstancesCursor
        @WebId,
        NULL,       
        @PreservePast,
        @NoMeetings OUTPUT,
        @Instances_cursor OUTPUT
    IF @Error <> 0
        RETURN @Error
    DECLARE @InstanceID int
    DECLARE @InstanceName nvarchar(8)
    IF @NoMeetings = 1
    BEGIN
        SET @InstanceID = 1
        GOTO DOWORK
    END
    FETCH NEXT 
    FROM 
        @Instances_cursor
    INTO
        @InstanceID
    WHILE @@FETCH_STATUS = 0
    BEGIN
DOWORK:
    SET @InstanceName = CONVERT( nvarchar(8), @InstanceID )
    EXEC proc_CreateDir
        @SiteId,
        @WebId,
        @DocLibUrl,             
        @InstanceName,          
        1,          
        0,
        0,                
        0,                      
        NULL,                   
        NULL,                   
        NULL                    
    IF @NoMeetings = 1
        GOTO DONEWORK
    FETCH NEXT 
    FROM 
        @Instances_cursor
    INTO
        @InstanceID
    END
    CLOSE @Instances_cursor
    DEALLOCATE @Instances_cursor
DONEWORK:
    RETURN 0

GO
