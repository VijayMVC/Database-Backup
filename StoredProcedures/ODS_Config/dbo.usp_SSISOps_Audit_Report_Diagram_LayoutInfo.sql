/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Audit_Report_Diagram_LayoutInfo]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
    Source : Pragmatic Works - BI xPress Auditing Framework 47
    Created On : 6/13/2013
    Purpose :  - Called from ControlFlow Diagram. Returns information about specified layouts
*/

CREATE PROCEDURE [dbo].[usp_SSISOps_Audit_Report_Diagram_LayoutInfo]
(
      @LayoutID varchar(5000)
    , @ExecutionID varchar(40)
    , @IsCatalogExecution BIT = 0
)
AS
BEGIN
    SET NOCOUNT ON

    SET FMTONLY OFF

    DECLARE @IsMultiLayouts BIT

    SET @IsMultiLayouts = 0

    CREATE TABLE #idlist_layout([LayoutId] VARCHAR(40))

    IF CHARINDEX(',', @LayoutID) > 0
    BEGIN
        DECLARE @pos INT
        
        SET @IsMultiLayouts = 1

        --add comma to end of list
        SET @LayoutID = @LayoutID + ','
        
        --loop through list
        WHILE CHARINDEX(',', @LayoutID) > 0
        BEGIN
          --get next comma position
          SET @pos = CHARINDEX(',', @LayoutID)

          --insert next value into table
          INSERT #idlist_layout VALUES (LTRIM(RTRIM(LEFT(@LayoutID, @pos - 1))))

          --delete inserted value from list
          SET @LayoutID = STUFF(@LayoutID, 1, @pos, '')
        END
    END
    ELSE
    BEGIN
        INSERT #idlist_layout VALUES (@LayoutID)
    END

    IF (@IsMultiLayouts = 1) OR (@ExecutionID IS NULL AND @IsCatalogExecution = 0) OR (@IsCatalogExecution = 1)
    BEGIN
        SELECT a.[LayoutXML]
            , a.[TasklistXML]
            , a.[LayoutID]
            , CAST(NULL AS DATETIME) AS [P_ExecutionStartDateTime]
            , '' AS [MachineName]
            , '' AS [UserName]
            , '' AS [PackageName]
            , a.[DFLayoutXML]
        FROM [SSISPackageLayout] a 
        WHERE a.[LayoutID] IN (SELECT [LayoutID] FROM #idlist_layout)
    END
    ELSE
    BEGIN
        SELECT a.[LayoutXML]
            , a.[TasklistXML]
            , a.[LayoutID]
            , b.[ExecutionStartDateTime] AS [P_ExecutionStartDateTime]
            , b.[MachineName]
            , b.[UserName]
            , b.[PackageName]
            , a.[DFLayoutXML] 
        FROM [SSISPackageLayout] a 
        LEFT JOIN [SSISPackageExecutionLog] b
            on a.[LayoutID] = b.[LayoutID]
        WHERE a.[LayoutID] = @LayoutID
            AND b.[ExecutionID] = @ExecutionID
    END

    SET NOCOUNT OFF
END

GO
