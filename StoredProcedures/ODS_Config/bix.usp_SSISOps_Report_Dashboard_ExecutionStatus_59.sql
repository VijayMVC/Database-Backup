/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_Dashboard_ExecutionStatus_59]    Script Date: 5/15/2018 12:11:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
 * Object: usp_SSISOps_Report_Dashboard_ExecutionStatus
 * --------------------------------------------------------------
 * Created By: Matt Whitfield
 * Source : Pragmatic Works - BI xPress Auditing Framework 59
 * Created On : 2/19/2016
 * --------------------------------------------------------------
 */
CREATE PROCEDURE [bix].[usp_SSISOps_Report_Dashboard_ExecutionStatus_59]
 @Status varchar(255)='ALL'
,@PackageNameFilter varchar(255)='%'
,@MachineName varchar(255)='%'
,@ExecutionAccountName varchar(255)='%'
,@ExecutionMode varchar(255)='ALL'
,@IntervalType varchar(10)='d'
,@MaxColCount int=1
AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT 
    a.[PackageName]
   ,a.[TotalErrorCount]
   ,a.[TotalWarningCount]
   ,a.[ExecutionStartDateTime]
   ,a.[ExecutionEndDateTime]
   ,a.[MachineName]
   ,ExecutionStatus=(case 
        --//If anything before 2 days and still No end date then must be stopped 
        when (a.[ExecutionStartDateTime]> getdate()-2 and a.[ExecutionEndDateTime] is null) then 'Running'
        when (a.[ExecutionEndDateTime] is not null) then 'Completed'
        else 'Unknown'
    END	) 
    ,convert([bigint],ISNULL(b.LoadedRecordCount,0)) as LoadedRecordCount
    ,Isnull(a.LayoutID,0) as LayoutID
    ,a.ExecutionID
FROM [dbo].[fn_SSISOps_Report_LogRowsByInterval](@Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @IntervalType, @MaxColCount) a
LEFT OUTER JOIN (select ExecutionID,Sum(RecordCount) as LoadedRecordCount from [bix].[vw_SSISPackageRowCountLog_59] where ComponentTypeCode='DEST' group by ExecutionID) b ON a.ExecutionID=b.ExecutionID 

GO
