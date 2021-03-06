/****** Object:  StoredProcedure [dbo].[CreateDailyCloseout]    Script Date: 5/15/2018 12:11:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Tim Fleck
-- Create date: 11/18/2014
-- Description:	Creates Daily Closeout Data
-- =============================================
CREATE PROCEDURE [dbo].[CreateDailyCloseout]
AS 
    BEGIN
        INSERT INTO FII.DailyCloseout
		SELECT
            franchise_id ,
            StoreNumber ,
            CONVERT(DATE, GETDATE() - 1) AS CloseDate ,
            SUM(CASE WHEN p.name IN ( 'WIP - Proof Pending', 'WIP - Design',
                                      'WIP - Ready for Production',
                                      'WIP - In Production', 'WIP - Finishing',
                                      'QC Ready', 'Built' )
                     THEN CASE WHEN vjli.discount < 0
                               THEN ( vjli.discount * -1 ) + vjli.ext_price
                               ELSE vjli.ext_price - vjli.discount
                          END
                     ELSE 0
                END) AS WIP ,
            SUM(CASE WHEN date_placed >= CONVERT(DATE, GETDATE() - 1)
                     THEN CASE WHEN vjli.discount < 0
                               THEN ( vjli.discount * -1 ) + vjli.ext_price
                               ELSE vjli.ext_price - vjli.discount
                          END
                     ELSE 0
                END) AS Placed ,
            SUM(CASE WHEN invoiced_on IS NOT NULL
                          AND paid_on IS NULL THEN amount_due + tax
                     ELSE 0
                END) AS AR ,
            SUM(CASE WHEN p.name = 'Built'
                     THEN CASE WHEN vjli.discount < 0
                               THEN ( vjli.discount * -1 ) + vjli.ext_price
                               ELSE vjli.ext_price - vjli.discount
                          END
                     ELSE 0
                END) AS Built
        FROM
            tbl_LineItemDetail AS vjli
            JOIN phases p ON p.phase_id = vjli.phase_id
            JOIN FII_ODS.Store.StoreFact s ON vjli.franchise_id = s.ZW_franchise_ID
            JOIN FII_ODS.System.StoreControl ON s.ZW_Franchise_ID = StoreControl.ZW_Franchise_ID
        WHERE
            FII_ODS.System.StoreControl.AsOfDate < GETDATE()
            AND FII_ODS.System.StoreControl.DataSource = 'KEY'
        GROUP BY
            franchise_id ,
            StoreNumber
        ORDER BY
            1
    END

GO
