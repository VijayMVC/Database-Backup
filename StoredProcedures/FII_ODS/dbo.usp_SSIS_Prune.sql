/****** Object:  StoredProcedure [dbo].[usp_SSIS_Prune]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Timothy Fleck
-- Create date: 8/12/2013
-- Description:	Prune Database for Keystone Extract
-- =============================================
CREATE PROCEDURE [dbo].[usp_SSIS_Prune]
AS 
    BEGIN

   -- DELETES DUP OrderHeaderFact
 DELETE FROM
        Orders.OrderHeaderFact
--  SELECT Orders.OrderHeaderFact.* FROM Orders.OrderHeaderFact
        WHERE
           OrderHeaderKey IN (
            SELECT
                Driver.OrderHeaderKey
            FROM
                ( SELECT
                    ROW_NUMBER() OVER ( PARTITION BY ZW_Franchise_ID,
                                        OrderID
                                          ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
                    ZW_Franchise_ID ,
                    OrderID ,
                    OrderHeaderKey
                  FROM
                    Orders.OrderHeaderFact WITH ( NOLOCK )
				) Driver
            WHERE
                Ranker > 1 )
  
    -- DELETES DUP EstimateHeaderFact
 DELETE FROM
        Estimate.EstimateHeaderFact
--  SELECT Orders.OrderHeaderFact.* FROM Orders.OrderHeaderFact
        WHERE
           EstimateHeaderKey IN (
            SELECT
                Driver.EstimateHeaderKey
            FROM
                ( SELECT
                    ROW_NUMBER() OVER ( PARTITION BY ZW_Franchise_ID,
                                        OrderID
                                          ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
                    ZW_Franchise_ID ,
                    OrderID ,
                    EstimateHeaderKey
                  FROM
                    Estimate.EstimateHeaderFact WITH ( NOLOCK )
				) Driver
            WHERE
                Ranker > 1 )
 
 
 
  -- DELETES DUP ContactFact
 --DELETE FROM
 --       [Contact].[ContactFact]
 ---- SELECT [Contact].[ContactFact].* FROM [Contact].[ContactFact]
 --       WHERE
 --          ContactKey IN (
 --           SELECT
 --               Driver.ContactKey  --,*
 --           FROM
 --               ( SELECT
 --                   ROW_NUMBER() OVER ( PARTITION BY ZW_Franchise_ID,
 --                                       ContactID
 --                                         ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
 --                   ZW_Franchise_ID ,
 --                   ContactID ,
 --                   ContactKey,UpdateCheckSum
 --                 FROM
 --                   [Contact].[ContactFact] WITH ( NOLOCK )
	--				--WHERE ZW_Franchise_ID='FSI0082'
	--			) Driver
 --           WHERE
 --               Ranker > 1 )
 
  --      DELETE
  --       orders.OrderHeaderFact
		--FROM
  --          orders.OrderHeaderFact F
  --          JOIN Staging.dbo.[Order Database_deletes] WITH ( NOLOCK ) ON f.OrderID = [Order Database_deletes].OrderID
  --                                                            AND f.ZW_Franchise_ID = [Order Database_deletes].zw_franchise_id 


  -- ----     DELETE
  -- ----         Contact.CustomerFact
  -- ----     FROM
  -- ----         Contact.CustomerFact
  -- ----         JOIN Staging.dbo.[Customer Database_deletes] ON CustomerFact.CustomerID = [Customer Database_deletes].CustomerID
  -- ----                                                         AND CustomerFact.ZW_Franchise_ID = [Customer Database_deletes].zw_franchise_id
		--	----LEFT JOIN Orders.OrderHeaderFact ON  [Customer Database_deletes].CustomerID = Orders.OrderHeaderFact.CustomerID AND [Customer Database_deletes].zw_franchise_id = Orders.OrderHeaderFact.ZW_Franchise_ID
		--	----WHERE Orders.OrderHeaderFact.CustomerKey IS NULL OR Orders.OrderHeaderFact.CustomerKey =-255
       

  -- --     DELETE FROM
  -- --         Contact.FastMailDim
  -- --     WHERE
  -- --         CustomerKey IN (
  -- --         SELECT
  -- --             CustomerKey
  -- --         FROM
  -- --             Contact.ContactFact
  -- --             JOIN Staging.dbo.[Contact Database_deletes] ON ContactFact.ContactID = [Contact Database_deletes].ContactID
  -- --                                                           AND ContactFact.ZW_Franchise_ID = [Contact Database_deletes].zw_franchise_id )
   
   
  -- --     DELETE
  -- --         Contact.ContactFact
  -- --     FROM
  -- --         Contact.ContactFact
  -- --        JOIN Staging.dbo.[Contact Database_deletes] ON ContactFact.ContactID = [Contact Database_deletes].ContactID
  -- --                                                        AND ContactFact.ZW_Franchise_ID = [Contact Database_deletes].zw_franchise_id
  
  --      DELETE
  --          orders.OrderDetailFact
  --      FROM
  --          orders.OrderDetailFact F
  --          JOIN Staging.dbo.[Order Details Database_deletes] WITH ( NOLOCK ) ON [Order Details Database_deletes].OrderDetailID = F.OrderDetailID
  --                                                            AND F.ZW_Franchise_ID = [Order Details Database_deletes].zw_franchise_id 
		
  --   ---- DELETES DUP DUPLICATE ORDERDETAILID's

        DELETE FROM
            Orders.OrderDetailFact
        WHERE
            Orders.OrderDetailFact.OrderDetailKey IN (
            SELECT
                Driver.OrderDetailKey
            FROM
                ( SELECT
                    ROW_NUMBER() OVER ( PARTITION BY Orders.OrderDetailFact.ZW_Franchise_ID,
                                        Orders.OrderDetailFact.OrderID,
                                        Orders.OrderDetailFact.OrderDetailID,
                                        Orders.OrderDetailFact.LineItemNumber ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
                    Orders.OrderDetailFact.ZW_Franchise_ID ,
                    Orders.OrderDetailFact.OrderID ,
                    Orders.OrderDetailFact.OrderDetailID ,
                    Orders.OrderDetailFact.LineItemNumber ,
                    Orders.OrderDetailFact.OrderDetailKey
                  FROM
                    Orders.OrderDetailFact WITH ( NOLOCK )
                ) Driver
            WHERE
                Ranker > 1 )

  --   ---- DELETES DUP DUPLICATE EstimateDetailFact's

        DELETE FROM
            Estimate.EstimateDetailFact
        WHERE
            Estimate.EstimateDetailFact.EstimateDetailKey IN (
            SELECT
                Driver.EstimateDetailKey
            FROM
                ( SELECT
                    ROW_NUMBER() OVER ( PARTITION BY ZW_Franchise_ID,
                                  OrderID,
                                    OrderDetailID,
                                       LineItemNumber ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
              ZW_Franchise_ID ,
                OrderID ,
                  OrderDetailID ,
                    LineItemNumber ,
                 EstimateDetailKey
                  FROM
                    Estimate.EstimateDetailFact WITH ( NOLOCK )
                ) Driver
            WHERE
                Ranker > 1 )


	 --       -- DELETES DUP ORDER/LINENUMBERS
        DELETE FROM
            Orders.OrderDetailFact
        WHERE
            Orders.OrderDetailFact.OrderDetailKey IN (
            SELECT
                Driver.OrderDetailKey
            FROM
                ( SELECT
                    ROW_NUMBER() OVER ( PARTITION BY Orders.OrderDetailFact.ZW_Franchise_ID,
                                        Orders.OrderDetailFact.OrderID,
                                        --Orders.OrderDetailFact.OrderDetailID,
                                        Orders.OrderDetailFact.LineItemNumber ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
                    Orders.OrderDetailFact.ZW_Franchise_ID ,
                    Orders.OrderDetailFact.OrderID ,
                    --Orders.OrderDetailFact.OrderDetailID ,
                    Orders.OrderDetailFact.LineItemNumber ,
                    Orders.OrderDetailFact.OrderDetailKey,
					Orders.OrderDetailFact.OLTP_UpdateDate
                  FROM
                    Orders.OrderDetailFact WITH ( NOLOCK )
                ) Driver
            WHERE
                Ranker > 1 
				)
 
 
 	 --       -- DELETES DUP ORDER/LINENUMBERS 
        DELETE FROM
            Estimate.EstimateDetailFact
        WHERE
            Estimate.EstimateDetailFact.EstimateDetailKey IN (
            SELECT
                Driver.EstimateDetailKey
            FROM
                ( SELECT
                    ROW_NUMBER() OVER ( PARTITION BY ZW_Franchise_ID,
                                        OrderID,
                                        --OrderDetailID,
                                        LineItemNumber ORDER BY OLTP_UpdateDate DESC ) AS Ranker ,
                    ZW_Franchise_ID ,
                    OrderID ,
                    --OrderDetailID ,
                    LineItemNumber ,
                    EstimateDetailKey,
					OLTP_UpdateDate
                  FROM
                    Estimate.EstimateDetailFact WITH ( NOLOCK )
                ) Driver
            WHERE
                Ranker > 1 
				)


        --UPDATE
        --    Contact.ContactFact
        --SET 
        --    CustomerKey = Contact.CustomerFact.CustomerKey
        --FROM
        --    Contact.ContactFact WITH ( NOLOCK )
        --    JOIN Contact.CustomerFact WITH ( NOLOCK ) ON Contact.ContactFact.ZW_Franchise_ID = Contact.CustomerFact.ZW_Franchise_ID
        --                                                 AND Contact.ContactFact.CustomerID = Contact.CustomerFact.CustomerID
        ----WHERE
        --    Contact.ContactFact.CustomerKey IS NULL

        UPDATE
            Orders.OrderDetailFact
        SET 
            OrderHeaderKey = Orders.OrderHeaderFact.OrderHeaderKey
        FROM
            Orders.OrderDetailFact WITH ( NOLOCK )
            JOIN Orders.OrderHeaderFact WITH ( NOLOCK ) ON Orders.OrderDetailFact.ZW_Franchise_ID = Orders.OrderHeaderFact.ZW_Franchise_ID
                                                           AND Orders.OrderDetailFact.OrderID = Orders.OrderHeaderFact.OrderID
        --WHERE
        --    Orders.OrderDetailFact.OrderHeaderKey IS NULL 


        --DELETE FROM
        --    Orders.OrderDetailFact
        --WHERE
        --    Orders.OrderDetailFact.OrderHeaderKey IS NULL


        UPDATE
            Orders.OrderDetailFact
        SET 
            ProductKey = ISNULL(ProductFact.ProductKey, -255)
--SELECT *
        FROM
            Orders.OrderDetailFact WITH ( NOLOCK )
            LEFT JOIN Product.ProductFact WITH ( NOLOCK ) ON OrderDetailFact.ProductID = ProductFact.ProductID
                                                             AND OrderDetailFact.ZW_Franchise_ID = ProductFact.ZW_Franchise_ID
        --WHERE
        --    Orders.OrderDetailFact.ProductKey IS NULL

        UPDATE
            Orders.OrderDetailFact
        SET 
            CenterKey = StoreFact.CenterKey
        FROM
            Orders.OrderDetailFact
            JOIN store.StoreFact ON OrderDetailFact.ZW_Franchise_ID = StoreFact.ZW_Franchise_ID

        UPDATE
            Orders.OrderHeaderFact
        SET 
            CenterKey = StoreFact.CenterKey
        FROM
            Orders.OrderHeaderFact
            JOIN store.StoreFact ON OrderHeaderFact.ZW_Franchise_ID = StoreFact.ZW_Franchise_ID

        Update Orders.OrderDetailFact
        SET OrderHeaderKey=ISNULL(Orders.OrderHeaderFact.OrderHeaderKey,-255)
            FROM
                Orders.OrderHeaderFact
                LEFT JOIN Orders.OrderDetailFact ON Orders.OrderHeaderFact.OrderID = Orders.OrderDetailFact.OrderID
                                                    AND Orders.OrderHeaderFact.ZW_Franchise_ID = Orders.OrderDetailFact.ZW_Franchise_ID
	
	-- Update ContactFact with PickedUPDate and LastSaleAmount for FastMail
	-- TAF 8/12/14

--	UPDATE Contact.CustomerFact
--SET LastPickedUpDate = Driver.PickedUpDate,
--	lastSaleAmount = Driver.SalesSubtotal	
----Select 
----  Driver.ZW_Franchise_ID,
----  Driver.CustomerID,
----  Driver.PickedUpDate,
----  Driver.SalesSubtotal,
----  Contact.CustomerFact.LastPickedUpDate,
----  Contact.CustomerFact.LastSaleAmount
--From
--  (Select
--    Row_Number() Over (Partition By Orders.OrderHeaderFact.ZW_Franchise_ID,
--    Orders.OrderHeaderFact.CustomerID Order By
--    Orders.OrderHeaderFact.PickedUpDate Desc) As Ranker,
--    Orders.OrderHeaderFact.ZW_Franchise_ID,
--    Orders.OrderHeaderFact.CustomerID,
--    Orders.OrderHeaderFact.PickedUpDate,
--    Orders.OrderHeaderFact.SalesSubtotal
--  From
--    Orders.OrderHeaderFact
--  Where
--    Orders.OrderHeaderFact.PickedUpDate > '1/1/2010' And
--    Orders.OrderHeaderFact.SalesSubtotal > 0) Driver
--  Inner Join Contact.CustomerFact On Driver.ZW_Franchise_ID =
--    Contact.CustomerFact.ZW_Franchise_ID And Driver.CustomerID =
--    Contact.CustomerFact.CustomerID
--Where
--  Driver.Ranker = 1

	
	
	
	
	
	END

GO
