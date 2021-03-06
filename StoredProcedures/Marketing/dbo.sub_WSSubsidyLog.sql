/****** Object:  StoredProcedure [dbo].[sub_WSSubsidyLog]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE sub_WSSubsidyLog
(
	@SubLStoreID int,
	@SubLYear int,
	@SubsidyQualifierID int,
	@SubLDesc varchar(255),
	@SubLAmount float,
	@InvoiceAmount float,
	@UsageDateFrom varchar(20),
	@UsageDateTo varchar(20)
)
AS

DECLARE @LocalSubLID int, @LocalSubLHID int

/*
SELECT @LocalSubLID = 1000;

SELECT TOP 1 @LocalSubLID = (SubLID + 1)
FROM SubsidyLog
ORDER BY SubLID desc;
*/

/* Get The Next ID */
SELECT  @LocalSubLID =  currentID from autoinc 
WHERE tablename = 'SubsidyLog' and fieldname = 'SubLId' 

SELECT  @LocalSubLID =  @LocalSubLID + 1

UPDATE AutoInc
SET CurrentID = @LocalSubLID
WHERE tablename = 'SubsidyLog' and fieldname = 'SubLId' 


SELECT @LocalSubLHID = H.SubHID
FROM SubsidyQualifiers Q INNER JOIN SubsidyDtl D ON Q.SubDID = D.SubDID
	INNER JOIN SubsidyHdr H ON D.SubHID = H.SubHID
WHERE
	Q.SubsidyQualifierID = @SubsidyQualifierID

INSERT INTO SubsidyLog(SubLStoreID, SubLYear, SubLDesc, SubLAmount, InvoiceAmount, UsageDateFrom, UsageDateTo, SubLID, SubsidyQualifierID, SubLDate, SubLHID, SubLHType, SubLType, SubLDType)
VALUES(@SubLStoreID, @SubLYear, @SubLDesc, @SubLAmount, @InvoiceAmount, @UsageDateFrom, @UsageDateTo, @LocalSubLID, @SubsidyQualifierID, getDate(), @LocalSubLHID, 3, 2, 0)

DECLARE @Remaining float

SELECT @Remaining = StoreSubRemainingAmount - @SubLAmount 
FROM StoreSubsidy
WHERE
	StoreSubYear = @SubLYear AND
	StoreSubHID = @LocalSubLHID
	AND StoreSID = @SubLStoreID

UPDATE StoreSubsidy
SET
	StoreSubRemainingAmount = @Remaining
WHERE
	StoreSubYear = @SubLYear
	AND StoreSubHID = @LocalSubLHID
	AND StoreSID = @SubLStoreID
GO
