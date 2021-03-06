/****** Object:  StoredProcedure [dbo].[sub_WSCoOpLog]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE sub_WSCoOpLog
(
	@CoOpID int,
	@SubsidyQualifierID int,
	@Year int,
	@Description varchar(255),
	@SubLAmount int,
	@InvoiceAmount float,
	@AmountReimbursed int,
	@UsageDateFrom datetime,
	@UsageDateTo datetime
)
AS
DECLARE 
	@LocalCoOpLogID int, 
	@RowCount int,
	@Counter int,
	@NewCoOpLogID int,
	@LocalSubLID int, --For SubsidyLog Insert
	@LocalSubLHID int, --For SubsidyLog Insert
	@NewSubLID int,
	@Remaining int,
	@CoOpStoreID int
	
SELECT @LocalCoOpLogID = 1000;
SELECT @Counter = 1;
SELECT TOP 1 @LocalCoOpLogID = (CoOpLogID + 1)
FROM CoOpLog
ORDER BY CoOpLogID desc;
INSERT INTO CoOpLog(CoOpLogID, SubsidyQualifierID, CoOpID, [Year], [Description], InvoiceAmount, AmountReimbursed, UsageDateFrom, UsageDateTo, ProcessDate)
VALUES(@LocalCoOpLogID, @SubsidyQualifierID, @CoOpID , @Year, @Description, @InvoiceAmount, @AmountReimbursed, @UsageDateFrom, @UsageDateTo, getDate())
SELECT @NewCoOpLogID = ( SELECT Top 1 CoOpLogID FROM CoOpLog ORDER BY CoOpLogID desc );
--Get the remaining amount from the CoOp Table
SELECT @Remaining = AmountAvailable - @SubLAmount
FROM CoOpAmounts
WHERE
	CoOpID = @CoOpID AND
	[Year] = @Year
UPDATE CoOpAmounts
SET
	AmountAvailable = @Remaining
WHERE
	CoOpID = @CoOpID AND
	[Year] = @Year
--NOW CREATE A ROW FOR EACH STORE IN THIS CO-OP IN THE SUBSIDY LOG TABLE
---SELECT @RowCount = ( SELECT Count(*) FROM CoOpStores WHERE CoOpID = @CoOpID )
DECLARE CoOpStoresCursor 
	CURSOR FOR 
			SELECT 
				co.CoOpStoreID
			FROM
				CoOpStores co
			INNER JOIN
				Contact.dbo.Contact1 ct1
			ON co.WebNumber  = ct1.uwebnumber
			WHERE
				co.CoOpID = @CoOpID
				AND ((ct1.key5 not like '%cod%' and ct1.key5 not like '%ltd%' and ct1.key5 not like '%srvcs%')
				OR (ct1.key5 is null))
	FOR READ ONLY
OPEN CoOpStoresCursor
FETCH NEXT FROM CoOpStoresCursor INTO @CoOpStoreID
WHILE @@FETCH_STATUS = 0 
  
--WHILE @Counter <= @RowCount  --BH adding the = sign, may not work, not fully thot through yet :)
BEGIN
	
	SELECT @LocalSubLID = 1000;
	
	SELECT TOP 1 @LocalSubLID = (SubLID + 1)
	FROM SubsidyLog
	ORDER BY SubLID desc;
	
	SELECT @LocalSubLHID = H.SubHID
	FROM SubsidyQualifiers Q INNER JOIN SubsidyDtl D ON Q.SubDID = D.SubDID
		INNER JOIN SubsidyHdr H ON D.SubHID = H.SubHID
	WHERE
		Q.SubsidyQualifierID = @SubsidyQualifierID
	INSERT INTO SubsidyLog(SubLStoreID, SubLYear, SubLDesc, SubLAmount, InvoiceAmount, UsageDateFrom, UsageDateTo, SubLID, SubsidyQualifierID, SubLDate, SubLHID, SubLHType, SubLType, SubLDType)
	VALUES(0, @Year, @Description, 0, @InvoiceAmount, @UsageDateFrom, @UsageDateTo, @LocalSubLID, @SubsidyQualifierID, getDate(), @LocalSubLHID, 3, 2, 0)
	
	SELECT @NewSubLID = ( SELECT Top 1 SubLID FROM SubsidyLog ORDER BY SubLID desc );
	--SELECT @Counter = @Counter + 1;
	
	INSERT INTO CoOpSubsidyLogs(CoOpLogID, SubLID, SubLStoreID)
	VALUES(@NewCoOpLogID, @NewSubLID, @CoOpStoreID)
	FETCH NEXT FROM CoOpStoresCursor Into @CoOpStoreID
	
END
CLOSE CoOpStoresCursor
GO
