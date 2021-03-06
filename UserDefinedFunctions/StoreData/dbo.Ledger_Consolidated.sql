/****** Object:  UserDefinedFunction [dbo].[Ledger_Consolidated]    Script Date: 5/15/2018 12:15:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION Ledger_Consolidated (
@IncludeEntryDate BIT, @LoadReversed BIT, @StartGroupID INT, @EndGroupID INT, @TransHeaderID INT, @TransHeaderClassTypeID INT, @TransDetailID INT, @TransDetailClassTypeID INT, @PayrollID INT, @EntryTypeList NVARCHAR(50)
)
RETURNS 
@MyTable TABLE 
(
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) NULL,
	[ModifiedByComputer] [nvarchar](25) NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[EntryDateTime] [datetime] NULL,
	[Amount] [decimal](18, 4) NULL,
	[Classification] [int] NULL,
	[IsTaxable] [bit] NULL,
	[GroupID] [int] NULL,
	[GLAccountID] [int] NULL,
	[GLAccountClassTypeID] [int] NULL,
	[AccountID] [int] NULL,
	[AccountClassTypeID] [int] NULL,
	[TransactionID] [int] NULL,
	[TransactionClassTypeID] [int] NULL,
	[TransDetailID] [int] NULL,
	[TransDetailClassTypeID] [int] NULL,
	[GoodsItemID] [int] NULL,
	[GoodsItemClassTypeID] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[DivisionID] [int] NULL,
	[Notes] [text] NULL,
	[IsModified] [bit] NULL,
	[IsUser] [bit] NULL,
	[TaxClassID] [int] NULL,
	[Quantity] [float] NULL,
	[PartID] [int] NULL,
	[PartClassTypeID] [int] NULL,
	[JournalID] [int] NULL,
	[JournalClassTypeID] [int] NULL,
	[Reconciled] [bit] NULL,
	[ReconciliationDateTime] [datetime] NULL,
	[ReconciliationID] [int] NULL,
	[ReconciliationClassTypeID] [int] NULL,
	[ProcessedDivisionID] [int] NULL,
	[GLClassificationType] [int] NULL,
	[GLClassTypeName] [varchar](50) NULL,
	[TransPartID] [int] NULL,
	[TransPartClassTypeID] [int] NULL,
	[StationID] [int] NULL,
	[PayrollID] [int] NULL,
	[PayrollClassTypeID] [int] NULL,
	[DepositJournalID] [int] NULL,
	[EntryType] [int] NULL,
	[EmployeeID] [int] NULL,
	[OffBalanceSheet] [bit] NOT NULL,
	[WarehouseID] [int] NULL,
	[InventoryID] [int] NULL
)
AS
BEGIN
    DECLARE @EntryTypeTbl TABLE(EntryType INT PRIMARY KEY);
    DECLARE @FilterEntryType BIT;
    
    INSERT INTO @EntryTypeTbl
    SELECT DISTINCT number
    FROM iter_intlist_to_table (@EntryTypeList);
    
    DECLARE @TempTbl TABLE(ID INT PRIMARY KEY, EntryType INT);
    
    IF @TransDetailID > -1 AND @TransHeaderID > -1
    BEGIN
      INSERT INTO @TempTbl
      SELECT ID, EntryType
      FROM Ledger
      WHERE TransactionID = @TransHeaderID 
            AND TransactionClassTypeID = @TransHeaderClassTypeID
            AND TransDetailID = @TransDetailID 
            AND TransDetailClassTypeID = @TransDetailClassTypeID
    END
    
    ELSE IF @TransDetailID > -1
    BEGIN
      INSERT INTO @TempTbl
      SELECT ID, EntryType
      FROM Ledger
      WHERE TransDetailID = @TransDetailID 
            AND TransDetailClassTypeID = @TransDetailClassTypeID
    END

    ELSE IF @TransHeaderID > -1
    BEGIN
      INSERT INTO @TempTbl
      SELECT ID, EntryType
      FROM Ledger
      WHERE TransactionID = @TransHeaderID 
            AND TransactionClassTypeID = @TransHeaderClassTypeID
    END
    
    ELSE IF @PayrollID > -1
    BEGIN
      INSERT INTO @TempTbl
      SELECT ID, EntryType
      FROM Ledger
      WHERE PayrollID = @PayrollID
    END
    
    ELSE IF ( ( @StartGroupID > -1 ) AND ( @EndGroupID > -1 ) )
    BEGIN
      INSERT INTO @TempTbl
      SELECT ID, EntryType
      FROM Ledger
      WHERE ( GroupID >= @StartGroupID ) AND ( GroupID <= @EndGroupID )
    END
    
    IF EXISTS( SELECT 1 FROM @EntryTypeTbl )
    BEGIN
      DELETE FROM @TempTbl
      WHERE EntryType NOT IN (SELECT EntryType FROM @EntryTypeTbl)
    END

    INSERT INTO @MyTable
    SELECT   MIN(ID) ID, CAST(-1 AS INT) StoreID, CAST(8905 AS INT) AS ClassTypeID, 
             CAST(NULL AS NVARCHAR(25)) ModifiedByUser, CAST(NULL AS NVARCHAR(25)) ModifiedByComputer, 
             CAST(NULL AS DATETIME) ModifiedDate, CAST(NULL AS INT) SeqID, 
             CAST(0 AS BIT) AS IsSystem, CAST(1 AS BIT) AS IsActive, 
             EntryDateTime, SUM(Amount) Amount, 
             Classification, IsTaxable, CAST(NULL AS INT) GroupID, 
             GLAccountID, GLAccountClassTypeID, AccountID, AccountClassTypeID, 
             TransactionID, TransactionClassTypeID, TransDetailID, TransDetailClassTypeID, 
             GoodsItemID, GoodsItemClassTypeID, NULL Description, DivisionID, NULL Notes, 
             CAST(0 AS BIT) IsModified, CAST(0 AS BIT) IsUser, TaxClassID, 
             SUM(Quantity) Quantity, PartID, PartClassTypeID,
             CAST(NULL AS INT) JournalID, CAST(NULL AS INT) JournalClassTypeID, 
             CAST(0 AS BIT) Reconciled, CAST(NULL AS DATETIME) ReconciliationDateTime, 
             CAST(NULL AS INT) ReconciliationID, CAST(NULL AS INT) ReconciliationClassTypeID, 
             MIN( ProcessedDivisionID ) AS ProcessedDivisionID, GLClassificationType, GLClassTypeName,
             TransPartID, TransPartClassTypeID, StationID, 
             PayrollID, PayrollClassTypeID, 
             CAST(NULL AS INT) DepositJournalID, 
             MAX(EntryType) EntryType, 
             EmployeeID, OffBalanceSheet, WarehouseID, InventoryID

    FROM     ( SELECT   ID, 
                        CASE @IncludeEntryDate WHEN 1 THEN EntryDateTime ELSE '1/1/1900' END EntryDateTime, 
                        CASE @LoadReversed WHEN 1 THEN -Amount ELSE Amount END Amount, 
                        GLAccountID, GLAccountClassTypeID, Classification, GLClassificationType, 
                        GLClassTypeName, IsTaxable, DivisionID, GoodsItemID, GoodsItemClassTypeID, 
                        AccountID, AccountClassTypeID, TaxClassID, TransactionID, TransactionClassTypeID,
                        TransDetailID, TransDetailClassTypeID, TransPartID, TransPartClassTypeID, 
                        StationID, Quantity, EmployeeID, OffBalanceSheet, InventoryID, WarehouseID, 
                        PartID, PartClassTypeID, ProcessedDivisionID, PayrollID, PayrollClassTypeID,
                        EntryType
               FROM     Ledger
               WHERE    ID IN (SELECT ID FROM @TempTbl)
             ) T
               
    GROUP BY EntryDateTime, GLAccountID, GLAccountClassTypeID, Classification, GLClassificationType, 
             GLClassTypeName, IsTaxable, DivisionID, GoodsItemID, GoodsItemClassTypeID, AccountID, 
             AccountClassTypeID, TaxClassID, TransactionID, TransactionClassTypeID, 
             TransDetailID, TransDetailClassTypeID, TransPartID, TransPartClassTypeID, StationID, 
             EmployeeID, OffBalanceSheet, InventoryID, WarehouseID, PartID, PartClassTypeID, 
             PayrollID, PayrollClassTypeID

    HAVING   SUM(Amount) <> 0

	RETURN 
END

GO
