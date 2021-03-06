/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Audit_Report_Diagram_DF_ExecutionDetail]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
Source : Pragmatic Works - BI xPress Auditing Framework 47
Created On : 6/13/2013
Purpose : 
    - This stored proc is called by DataFlow Monitoring. It log returns records for specified execution and dataflow.
*/
CREATE PROC [dbo].[usp_SSISOps_Audit_Report_Diagram_DF_ExecutionDetail]
(
      @ExecutionID VARCHAR(50)
    , @DataFlowID  VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @execid uniqueidentifier
    DECLARE @dfid uniqueidentifier

    SET @execid = CAST(@ExecutionID AS uniqueidentifier)

    IF (ISNULL(@DataFlowID, '') = '')
    BEGIN
        SET @dfid = NULL
    END
    ELSE
    BEGIN
        SET @dfid = CAST(@DataFlowID AS uniqueidentifier)
    END
    
    IF (@dfid IS NULL)
    BEGIN
        SELECT d.[event], d.[message], d.[starttime], d.[sourceid] from [SSISDataFlowExecutionLog] d WHERE d.[executionid] = @execid ORDER BY d.[id]
    END
    ELSE
    BEGIN
        SELECT d.[event], d.[message], d.[starttime], d.[sourceid] from [SSISDataFlowExecutionLog] d WHERE d.[executionid] = @execid and d.[sourceid] = @dfid ORDER BY d.[id]
    END

    SET NOCOUNT OFF
END

GO
