/****** Object:  StoredProcedure [dbo].[proc_SetWorkflowWakeup]    Script Date: 5/15/2018 12:12:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetWorkflowWakeup (
        @SiteId                uniqueidentifier,
        @WebId                 uniqueidentifier,
        @ListId                uniqueidentifier,
        @WorkflowInstanceId    uniqueidentifier,
        @WakeupTime            datetime,
        @HadWakeupTime         bit
        )
AS
    SET NOCOUNT ON
    IF @WakeupTime < CONVERT(datetime, '99991231 23:59:59')
    BEGIN
        IF @HadWakeupTime = 1
        BEGIN
			EXEC proc_UpdateWorkItem @WorkflowInstanceId, @SiteId, @WakeupTime, NULL, NULL, NULL, 1 
        END
        ELSE
        BEGIN
		    DECLARE @WorkItemHostType uniqueidentifier
			SET @WorkItemHostType = CONVERT(uniqueidentifier, 'BDEADF09-C265-11d0-BCED-00A0C90AB50F')
		    DECLARE @WorkflowTimerType uniqueidentifier
			SET @WorkflowTimerType = CONVERT(uniqueidentifier, 'BDEADE79-C265-11d0-BCED-00A0C90AB50F')
            EXEC proc_AddWorkItem @WorkflowInstanceId ,
                                  @WakeupTime ,
                                  @WorkItemHostType ,
                                  @WorkflowTimerType ,
                                  @SiteId ,
                                  @ListId ,
                                  0 ,
                                  @WebId ,
                                  NULL ,
                                  @WorkflowInstanceId ,
                                  0 ,
                                  NULL ,
                                  NULL ,
                                  NULL  
        END		
    END
    ELSE
    BEGIN
		DELETE FROM
			dbo.ScheduledWorkItems
		WHERE
			SiteId = @SiteId AND
			Id = @WorkflowInstanceId        
    END

GO
