/****** Object:  UserDefinedFunction [dbo].[TaxItemsTableFromTransDetail]    Script Date: 5/15/2018 12:15:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION TaxItemsTableFromTransDetail (	
	-- Add the parameters for the function here
	@TransDetailID int
)
RETURNS @MyTable TABLE (TransDetailID int, TaxAccountID varchar(50), TaxName varchar(50), TaxRate varchar(50), TaxAmount varchar(50) )
AS
BEGIN 
	declare @startpos int;
	declare @endpos int;
	declare @i int;
	declare @strlen int;
	declare @rowcount int;
	declare @TaxAccountID varchar(50); -- Int;
	declare @TaxName varchar(50);
	declare @TaxRate varchar(50); -- Float;
	declare @TaxAmount varchar(50); -- Float;
	declare @TaxItemsXML varchar(4000);
	
	set @TaxItemsXML= (Select Convert(VarChar(4000),TaxItems) from TransDetail where TransDetail.ID = @TransDetailID);
	
	set @startpos = charindex('<Tax>', @TaxItemsXML, 0);
	set @TaxName = 'not looked up';

    insert into @myTable
        SELECT 
                TempLineItem.TransDetailID
              , TaxAccountID
              , TaxAccount.AccountName AS TaxName
        
              , CAST( CASE 
                       WHEN CharIndex(',', TempLineItem.TaxRateStr) > 0 THEN Replace(TempLineItem.TaxRateStr, ',', '.')
                       ELSE TempLineItem.TaxRateStr
                       END AS float) AS TaxRate
        
              , CAST( CASE 
                       WHEN CharIndex(',', TempLineItem.TaxAmountStr) > 0 THEN Replace(TempLineItem.TaxAmountStr, ',', '.')
                       ELSE TempLineItem.TaxAmountStr
                       END AS float) AS TaxAmount
        FROM
        (  SELECT 
                TransHeaderID
              , TransDetailID
              , ThisTax.value('(TaxAccountID/text())[1]'          , 'varchar(50)') AS TaxAccountIDStr
              , ThisTax.value('(TaxRate/text())[1]'               , 'varchar(50)') AS TaxRateStr
              , ThisTax.value('(TaxAmount/text())[1]'             , 'varchar(50)') AS TaxAmountStr
        
              , CAST( Substring(ThisTax.value('(TaxAccountID/text())[1]', 'varchar(50)')
                                , 2
                                , charindex(',', ThisTax.value('(TaxAccountID/text())[1]', 'varchar(50)') )-2 ) AS int ) AS TaxAccountID
          FROM
          (
            SELECT  
                    TransHeaderID
                  , ID AS TransDetailID
                  , CAST( TaxItems AS XML ) AS XMLField
            FROM TransDetail
            WHERE ID = @TransDetailID
          ) AS TempLI
          CROSS APPLY XMLField.nodes('//Taxes/Tax') AS Taxes(ThisTax)
        ) AS TempLineItem
          LEFT OUTER JOIN GLAccount As TaxAccount ON TaxAccount.ID = TempLineItem.TaxAccountID

	RETURN 

END

GO
