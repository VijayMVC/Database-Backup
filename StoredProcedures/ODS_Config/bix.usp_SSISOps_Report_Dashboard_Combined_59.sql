/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_Dashboard_Combined_59]    Script Date: 5/15/2018 12:11:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
 * Object: usp_SSISOps_Report_Dashboard_Combined
 * --------------------------------------------------------------
 * Created By: Matt Whitfield
 * Source : Pragmatic Works - BI xPress Auditing Framework 59
 * Created On : 2/19/2016
 * --------------------------------------------------------------
 */
CREATE PROCEDURE [bix].[usp_SSISOps_Report_Dashboard_Combined_59]
 @Status varchar(255)='ALL'
,@PackageNameFilter varchar(255)='%'
,@MachineName varchar(255)='%'
,@ExecutionAccountName varchar(255)='%'
,@ExecutionMode varchar(255)='ALL'
,@IntervalType varchar(10)='d'
,@MaxColCount int=1
AS
EXECUTE [bix].[usp_SSISOps_Report_Dashboard_ExecutionStatus_59] @Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @IntervalType, @MaxColCount
EXECUTE [bix].[usp_SSISOps_Report_Dashboard_Top20s_59] @Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @IntervalType, @MaxColCount

GO
