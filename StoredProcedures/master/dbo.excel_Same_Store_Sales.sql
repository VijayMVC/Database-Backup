/****** Object:  StoredProcedure [dbo].[excel_Same_Store_Sales]    Script Date: 5/15/2018 12:10:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC excel_Same_Store_Sales
as
DECLARE @Month INT = 1
DECLARE @Year INT = 2015
DECLARE @country CHAR(2) = 'US'

DECLARE @LastYearMonth DATETIME 
SET @LastYearMonth = CAST(@Month AS CHAR(2)) + '/1/'
    + CAST(@Year - 1 AS CHAR(4))
 --'10/1/13'
DECLARE @ThisYearMonth DATETIME
 --= '10/1/14'
SET @ThisYearMonth = CAST(@Month AS CHAR(2)) + '/1/' + CAST(@Year AS CHAR(4))
DECLARE @LastYearEndMonth DATETIME
 --= '11/1/13'
SET @LastYearEndMonth = DATEADD(MONTH, 1, @LastYearMonth)
DECLARE @ThisYearEndMonth DATETIME
 --= '11/1/14'
SET @ThisYearEndMonth = DATEADD(MONTH, 1, @ThisYearMonth)
DECLARE @LastYearEndMonthSSS DATETIME
SET @LastYearEndMonthSSS = DATEADD(DAY, -1, @LastYearEndMonth)
DECLARE @ThisYearEndMonthSSS DATETIME
SET @ThisYearEndMonthSSS = DATEADD(DAY, -1, @ThisYearEndMonth)

DECLARE @LastYearMontha DATETIME 
SET @LastYearMontha = --@LastYearMonth
DATEADD(HOUR,-13,@LastYearMonth)
DECLARE @ThisYearMontha DATETIME 
SET @ThisYearMontha = --@ThisYearMonth
DATEADD(HOUR,-13,@ThisYearMonth)
DECLARE @LastYearEndMontha DATETIME 
SET @LastYearEndMontha = --@LastYearEndMonth
DATEADD(HOUR,-13,@LastYearEndMonth)
DECLARE @ThisYearEndMontha DATETIME 
SET @ThisYearEndMontha = --@ThisYearEndMonth;
DATEADD(HOUR,-13,@ThisYearEndMonth);

WITH    Centers
          AS ( 
		  SELECT
                Store.StoreFact.CenterKey ,
                Store.StoreFact.ZW_Franchise_ID ,
                Store.StoreFact.StoreNumber ,
                Store.StoreFact.OpenStatus ,
                Store.CountryDim.CountryName AS CountryName ,
                Store.CountryDim.CountryCode ,
                Store.StoreFact.StoreOpenDate ,
                System.ZipCode.city ,
                System.ZipCode.state ,
                System.ZipCode.timezone ,
                System.ZipCode.dst ,
                System.ZipCode.zip ,
                System.StoreControl.DataSource ,
                System.StoreControl.AsOfDate
               FROM
                Store.StoreFact
                INNER JOIN Store.CountryDim ON Store.StoreFact.CountryKey = Store.CountryDim.CountryKey
                LEFT JOIN System.ZipCode ON Store.StoreFact.Zip = System.ZipCode.zip
                LEFT JOIN System.StoreControl ON Store.StoreFact.ZW_Franchise_ID = System.StoreControl.ZW_Franchise_ID
               WHERE
                Store.StoreFact.OpenStatus = 'Open'
                AND Store.StoreFact.StoreOpenDate < @LastYearMonth --'10/1/13'
                AND Store.CountryDim.CountryCode = @country--'US'
                
             )
    SELECT
		Centers.CountryCode,  
        Centers.StoreNumber ,
        Centers.ZW_Franchise_ID ,
        Centers.DataSource ,
        Sum13.Amount AS [13PickedUP] ,
        Royalty13.TotalSales AS [13SSS] ,
        Sum14.Amount AS [14PickedUP] ,
        Royalty14.TotalSales AS [14SSS]
    INTO
        #Temp
    FROM
        Centers
        left JOIN ( SELECT
                        GL.GLFact.ZW_Franchise_ID ,
                        SUM(GL.GLFact.Amount * -1) AS Amount
                     FROM
                        GL.GLFact
                        JOIN Centers ON GLFact.CenterKey = Centers.CenterKey
                     WHERE
                        GL.GLFact.AccountCode IN ( 4001, 4002, 4003, 4110,
                                                   4120 )
                        AND GL.GLFact.TransactionDateTime >= CASE
                                                              WHEN Centers.DataSource = 'KEY' OR Centers.CountryCode IN('AU','GB')
                                                              THEN @LastYearMonth
                                                              ELSE @LastYearMontha
                                                             END
                        AND GL.GLFact.TransactionDateTime < CASE
                                                              WHEN Centers.DataSource = 'KEY' OR Centers.CountryCode IN('AU','GB')
                                                              THEN @LastYearEndMonth
                                                              ELSE @LastYearEndMontha
                                                            END
                     GROUP BY
                        GL.GLFact.ZW_Franchise_ID
                   ) Sum13 ON Sum13.ZW_Franchise_ID = Centers.ZW_Franchise_ID
        left JOIN ( SELECT
                        GL.GLFact.ZW_Franchise_ID ,
                        SUM(GL.GLFact.Amount * -1) AS Amount
                     FROM
                        GL.GLFact
                        JOIN Centers ON GLFact.CenterKey = Centers.CenterKey
                     WHERE
                        GL.GLFact.AccountCode IN ( 4001, 4002, 4003, 4110,
                                                   4120 )
                        AND GL.GLFact.TransactionDateTime >= CASE
                                                              WHEN Centers.DataSource = 'KEY' OR Centers.CountryCode IN('AU','GB')
                                                              THEN @ThisYearMonth
                                                              ELSE @ThisYearMontha
                                                             END
                        AND GL.GLFact.TransactionDateTime < CASE
                                                              WHEN Centers.DataSource = 'KEY' OR Centers.CountryCode IN('AU','GB')
                                                              THEN @ThisYearEndMonth
                                                              ELSE @ThisYearEndMontha
                                                            END
                     GROUP BY
                        GL.GLFact.ZW_Franchise_ID
                   ) Sum14 ON Sum14.ZW_Franchise_ID = Centers.ZW_Franchise_ID
        left JOIN Royalty.CenterSales Royalty13 ON Royalty13.StoreNumber = Centers.StoreNumber
                                                    AND Royalty13.PeriodEndDate = @LastYearEndMonthSSS --'10/31/13'
        left JOIN Royalty.CenterSales Royalty14 ON Royalty14.StoreNumber = Centers.StoreNumber
                                                    AND Royalty14.PeriodEndDate = @ThisYearEndMonthSSS
 --'10/31/14'
SELECT
    Period=CAST(@ThisYearMonth AS DATE),
	CountryCode,
	StoreNumber ,
    ZW_Franchise_ID ,
    CASE WHEN ISNULL(DataSource, 'FSI')='FSI' AND ( ISNULL([13PickedUP],[14PickedUP]) IS NULL ) 
	THEN 'NA' 
	ELSE ISNULL(DataSource, 'FSI') 
	END AS Source ,
    [13PickedUP] AS LY_Picked,
    [13SSS] AS LY_SSS,
    [LY_Diff] = [13PickedUP] - [13SSS] ,
    [14PickedUP] AS [TY_PickedUP] ,
    [14SSS] AS [TY_SSS] ,
    [TY_Diff] = [14PickedUP] - [14SSS],
	POSITION = ABS([14PickedUP] - [14SSS])
FROM
    #Temp
ORDER BY
    POSITION desc
DROP TABLE #Temp;
GO
