/****** Object:  StoredProcedure [dbo].[proc_MSS_CleanupPropertyTables]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_CleanupPropertyTables
AS  
    DECLARE @Ret INT
    SET @Ret = 1

    SET XACT_ABORT ON

    BEGIN TRANSACTION

        CREATE TABLE #temp ( DocId INT )
        CREATE UNIQUE CLUSTERED INDEX [IX_TempDocid] ON [#temp]([DocId]) WITH IGNORE_DUP_KEY ON [PRIMARY]

        INSERT INTO #temp
            SELECT DocId FROM MSSDocSdids 
                WHERE DocId NOT IN ( SELECT DocId FROM MSSCrawlUrl )
        IF @@ROWCOUNT = 0
            GOTO _Finish

        INSERT INTO #temp
            SELECT DocId FROM MSSDuplicateHashes
                WHERE DocId NOT IN ( SELECT DocId FROM MSSCrawlUrl )

        INSERT INTO #temp
            SELECT DocId FROM MSSDefinitions
                WHERE DocId NOT IN ( SELECT DocId FROM MSSCrawlUrl ) 

        INSERT INTO #temp
            SELECT DocId FROM MSSDocProps
                WHERE DocId NOT IN ( SELECT DocId FROM MSSCrawlUrl ) 

        DELETE FROM MSSDocSdids WHERE DocId IN ( SELECT DocId FROM #temp )
        DELETE FROM MSSDuplicateHashes WHERE DocId IN ( SELECT DocId FROM #temp )
        DELETE FROM MSSDefinitions WHERE DocId IN ( SELECT DocId FROM #temp ) 
        DELETE FROM MSSDocProps WHERE DocId IN ( SELECT DocId FROM #temp )

        SELECT @Ret = Count(*) FROM #temp
        SET @Ret = @Ret + 1     

_Finish:

        DROP TABLE #temp

    COMMIT TRANSACTION

    RETURN @Ret

GO
