/****** Object:  StoredProcedure [dbo].[proc_CreateDocLibSubFoldersForMtgInst]    Script Date: 5/15/2018 12:12:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateDocLibSubFoldersForMtgInst
(
    @SiteId         uniqueidentifier,
    @WebId          uniqueidentifier,
    @WebUrl         nvarchar(256) = NULL,
    @InstanceID     int
)
AS
    SET NOCOUNT ON
    DECLARE @DocLibFolders_cursor CURSOR
    DECLARE @Error int
    EXEC @Error = proc_GetDoclibFoldersCursor
        @SiteId,
        @WebId,
        @WebUrl,
        @DocLibFolders_cursor OUTPUT
    IF @Error <> 0
        RETURN @Error
    DECLARE @InstanceName nvarchar(8)
    SET @InstanceName = CONVERT( nvarchar(8), @InstanceID )
    DECLARE @DocLibUrl nvarchar(256)
    FETCH NEXT 
    FROM 
        @DocLibFolders_cursor
    INTO
        @DocLibUrl
    WHILE @@FETCH_STATUS = 0
    BEGIN
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
        FETCH NEXT 
        FROM 
            @DocLibFolders_cursor
        INTO
            @DocLibUrl
    END
    CLOSE @DocLibFolders_cursor
    DEALLOCATE @DocLibFolders_cursor
    RETURN 0

GO
