/****** Object:  StoredProcedure [dbo].[proc_AddWorkflow]    Script Date: 5/15/2018 12:11:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddWorkflow (
        @WorkflowTemplateId    uniqueidentifier,
        @WorkflowInstanceId    uniqueidentifier,
        @SiteId                uniqueidentifier,
        @WebId                 uniqueidentifier,
        @ListId                uniqueidentifier,
        @ItemId                int,
        @Level                 tinyint,
        @Version               int,
        @TaskListId            uniqueidentifier,
        @AdminTaskListId       uniqueidentifier,
        @Author                int,
        @ProcessingId          uniqueidentifier,
        @InstanceData          image,
        @InstanceDataSize      int,
        @Modifications         ntext,
        @StatusFieldOrdinal    int,
        @StatusField           nvarchar(64)
        )
AS
        SET NOCOUNT ON
        DECLARE @iRet int
        SET @iRet = 0
        DECLARE @oldTranCount int
        SET @oldTranCount = @@TRANCOUNT
        DECLARE @WFState    int
        DECLARE @ItemGUID   uniqueidentifier
        DECLARE @oldVersion int
        DECLARE @Created    datetime
        SET @Created = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
        IF @workflowInstanceId IS NULL
        BEGIN
            SET @workflowInstanceId = NEWID()    
        END
        SET @WFState = 2048 | 2
        IF @ProcessingId IS NOT NULL
        BEGIN
            SET @WFState = @WFState | 1
        END
        BEGIN TRAN
        SELECT TOP 1
            @ItemGUID = tp_GUID,
            @oldVersion = tp_Version
        FROM
            dbo.UserData WITH (UPDLOCK)
        WHERE
            tp_ListId = @ListId AND
            tp_ID = @ItemId AND
            tp_Level = @Level AND (@Version = 0 OR tp_Version = @Version) AND
            tp_RowOrdinal = 0
        IF (@@ROWCOUNT = 0)
        BEGIN
            IF (@Version <> 0 AND @oldVersion <> @Version)
                SET @iRet = 1150
            ELSE
                SET @iRet = 82				
            GOTO CLEANUP
        END
        DECLARE @Configuration int
        SELECT TOP 1
            @Configuration = Configuration
        FROM dbo.WorkflowAssociation WITH (UPDLOCK)
        WHERE
            SiteId = @SiteId AND
            Id = @WorkflowTemplateId
        IF @@ROWCOUNT = 0
        BEGIN
            SET @iRet = 2
            GOTO CLEANUP
        END        
        IF (@Configuration & (128 | 1024 | 512)) = 0 AND
          ((@Configuration & 256) <> 0 OR
          NOT EXISTS (SELECT
                          *
                      FROM
                          dbo.Workflow
                      WHERE
                          SiteId = @SiteId AND
                          ListId = @ListId AND
                          ItemId = @ItemId AND
                          TemplateId = @WorkflowTemplateId AND
                          (InternalState & (4 | 8)) = 0))
        BEGIN        
            INSERT INTO dbo.Workflow (
                Id, TemplateId, ListId, SiteId, WebId, ItemId, ItemGUID, TaskListId, AdminTaskListId, Author, Modified, Created, StatusVersion, Status1, Status2, Status3, Status4, Status5, Status6, Status7, Status8, Status9, Status10, TextStatus1, TextStatus2, TextStatus3, TextStatus4, TextStatus5, Modifications,
                InstanceDataVersion,
                InstanceData,
                InstanceDataSize,
                LockMachineId,
                LockMachinePID,
                InternalState
                )
            VALUES (
                @WorkflowInstanceId,
                @WorkflowTemplateId,
                @ListId,
                @SiteId,
                @WebId,
                @ItemId,
                @ItemGUID,
                @TaskListId,
                @AdminTaskListId, 
                @Author,
                @Created,
                @Created,
                0, 
                0, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                @Modifications,
                0,
                @InstanceData,
                @InstanceDataSize,
                @ProcessingId,
                0,
                @WFState
                )
            IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
            BEGIN
                SET @iRet = 82
                GOTO CLEANUP
            END
            UPDATE
                dbo.WorkflowAssociation
            SET
                InstanceCount = InstanceCount + 1
            WHERE
                SiteId = @SiteId AND
                Id = @WorkflowTemplateId
            IF (@@ROWCOUNT = 0)
            BEGIN
                SET @iRet = 82
                GOTO CLEANUP
            END
            IF (@StatusField IS NOT NULL)
            BEGIN
              DECLARE @query nvarchar(4000)
              SET @query = N' UPDATE dbo.UserData'
                              + N' SET dbo.UserData.[' + @StatusField + N']= CAST ( CAST (@WorkflowInstanceId as varbinary) as nvarchar)'
                              + N' WHERE tp_ListId = @ListId AND tp_ID = @ItemId'
                              + N' AND tp_RowOrdinal = @RowOrdinal AND (@Version = 0 OR tp_Version = @Version)'
                              + N' AND tp_Level = @Level'
              EXEC sp_executesql @query, N'@WorkflowInstanceId uniqueidentifier, @ListId uniqueidentifier, @ItemId int, @RowOrdinal int, @Version int, @Level tinyint',
                                 @WorkflowInstanceId, @ListId, @ItemId, @StatusFieldOrdinal, @Version, @Level
              IF (@@ROWCOUNT <> 1 OR @@ERROR <> 0)
              BEGIN
                  IF (@Version <> 0 AND @oldVersion <> @Version)
                      SET @iRet = 1150
                  ELSE
                      SET @iRet = 87
                  GOTO CLEANUP
              END
            END
        END
        ELSE
        BEGIN
            SET @iRet = 183
            GOTO CLEANUP
        END
CLEANUP:
        IF @iRet <> 0
        BEGIN
            IF @@TRANCOUNT = @oldTranCount + 1
            BEGIN
                ROLLBACK TRAN
            END
        END
        ELSE
        BEGIN
            COMMIT TRAN
        END
        RETURN @iRet

GO
