/****** Object:  View [bix].[vw_SSISTaskExecutionLog_59]    Script Date: 5/15/2018 12:14:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [bix].[vw_SSISTaskExecutionLog_59]
AS
(
    SELECT 
        [LogID],
        [ExecutionID],
        [SourceID],
        [ParentSourceID],
        [SourceName],
        [SourceType],
        [ExecutionStartDateTime],
        [ExecutionEndDateTime],
        [TotalErrorCount],
        [TotalWarningCount],
        [TotalRecordsExtracted],
        [TotalRecordsLoaded],
        [CPUUtilization],
        [RAMUtilization],
        [DiskUtilization],
        [CustomValue_Num_1],
        [CustomValue_Num_2],
        [CustomValue_Num_3],
        [CustomValue_Dt_1],
        [CustomValue_Dt_2],
        [CustomValue_Dt_3],
        [CustomValue_Str_1],
        [CustomValue_Str_2],
        [CustomValue_Str_3]
    FROM [dbo].[SSISTaskExecutionLog]
)
GO
