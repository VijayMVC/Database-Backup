/****** Object:  StoredProcedure [dbo].[zw_upsert_StoreInformationDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_StoreInformationDatabase ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@CompanyName varchar(50)   = NULL , 
@Address varchar(50)   = NULL , 
@City varchar(25)   = NULL , 
@State varchar(25)   = NULL , 
@Zip varchar(25)   = NULL , 
@County varchar(20)   = NULL , 
@Country varchar(9)   = NULL , 
@Phone varchar(15)   = NULL , 
@Fax varchar(15)   = NULL , 
@EMailAddress varchar(75)   = NULL , 
@DefaultAreaCode varchar(25)   = NULL , 
@DefaultLeadDays smallint  = NULL , 
@DefaultDueTime datetime  = NULL , 
@MPW varchar(40)   = NULL , 
@TaxID varchar(75)   = NULL , 
@ShopLaborRate float  = NULL , 
@FieldLaborRate float  = NULL , 
@MaterialMultiplier float  = NULL , 
@InstallationTaxable bit  = NULL , 
@Equipment1 varchar(12)   = NULL , 
@Equipment2 varchar(12)   = NULL , 
@Equipment3 varchar(12)   = NULL , 
@EquipmentRate1 float  = NULL , 
@EquipmentRate2 float  = NULL , 
@EquipmentRate3 float  = NULL , 
@EquipmentMinimum1 float  = NULL , 
@EquipmentMinimum2 float  = NULL , 
@EquipmentMinimum3 float  = NULL , 
@ProductionLoc1 varchar(12)   = NULL , 
@ProductionLoc2 varchar(12)   = NULL , 
@ProductionLoc3 varchar(12)   = NULL , 
@InstallationEnabled bit  = NULL , 
@AVIEnabled bit  = NULL , 
@ProdLocEnabled bit  = NULL , 
@PrintAVIs bit  = NULL , 
@PrintInstallation bit  = NULL , 
@StateSalesTaxRate float  = NULL , 
@CountySalesTaxRate float  = NULL , 
@StoreType varchar(15)   = NULL , 
@ManagerID int  = NULL , 
@OpenDate datetime  = NULL , 
@Logo image  = NULL , 
@StdTerms varchar(MAX)   = NULL , 
@TagLine varchar(50)   = NULL , 
@EstGreeting bit  = NULL , 
@PrintDepositReqd bit  = NULL , 
@DepositPercentage float  = NULL , 
@EstIntroText varchar(MAX)   = NULL , 
@Statement0to30 varchar(MAX)   = NULL , 
@Statement30to60 varchar(MAX)   = NULL , 
@Statement60to90 varchar(MAX)   = NULL , 
@StatementOver90 varchar(MAX)   = NULL , 
@TrackLunch bit  = NULL , 
@AutoDecLunch bit  = NULL , 
@STDLunchLength smallint  = NULL , 
@OTOverEight bit  = NULL , 
@OTOverTen bit  = NULL , 
@OTOverForty bit  = NULL , 
@ProductLaborRate float  = NULL , 
@ProductMaterialRate float  = NULL , 
@FranchiseFee1 float  = NULL , 
@FranchiseFee2 float  = NULL , 
@FranchiseFee3 float  = NULL , 
@AdvertisingFee1 float  = NULL , 
@AdvertisingFee2 float  = NULL , 
@AdvertisingFee3 float  = NULL , 
@OrdContactDays int  = NULL , 
@EstContactDays int  = NULL , 
@ARContactDays int  = NULL , 
@BuiltContactDays int  = NULL , 
@DaysBetweenContacts int  = NULL , 
@InvoicePrefix varchar(10)   = NULL , 
@SalesTax1Name varchar(20)   = NULL , 
@SalesTax2Name varchar(20)   = NULL , 
@ShippingTaxable bit  = NULL , 
@RoyaltyBasedOn int  = NULL , 
@AuditTrackingOn bit  = NULL , 
@InBeforeTime datetime  = NULL , 
@SalesTaxRegion int  = NULL , 
@MktgFlag1Name varchar(30)   = NULL , 
@MktgFlag2Name varchar(30)   = NULL , 
@MktgFlag3Name varchar(30)   = NULL , 
@MktgFlag4Name varchar(30)   = NULL , 
@MktgFlag5Name varchar(30)   = NULL , 
@CustomField1Name varchar(30)   = NULL , 
@CustomField1PickList varchar(MAX)   = NULL , 
@CustomField1LimitToList bit  = NULL , 
@CustomField2Name varchar(30)   = NULL , 
@CustomField2PickList varchar(MAX)   = NULL , 
@CustomField2LimitToList bit  = NULL , 
@CustomList1Name varchar(30)   = NULL , 
@CustomList2Name varchar(30)   = NULL , 
@DefaultInvoice varchar(40)   = NULL , 
@DefaultEstimate varchar(40)   = NULL , 
@DefaultWorkOrder varchar(40)   = NULL , 
@DefaultStatement varchar(40)   = NULL , 
@DefaultWIP varchar(40)   = NULL , 
@DefaultRoyaltyReport varchar(40)   = NULL , 
@CommissionBasedOn int  = NULL , 
@DefaultReports varchar(MAX)   = NULL , 
@AddressFormat int  = NULL , 
@Projects varchar(MAX)   = NULL , 
@NoInvoices int  = NULL , 
@NoEstimates int  = NULL , 
@Version float  = NULL , 
@OrderMinimum float  = NULL , 
@DefaultProofDays int  = NULL , 
@MktgFlag6Name varchar(30)   = NULL , 
@MktgFlag7Name varchar(30)   = NULL , 
@MktgFlag8Name varchar(30)   = NULL , 
@MktgFlag9Name varchar(30)   = NULL , 
@MktgFlag10Name varchar(30)   = NULL , 
@MktgFlag11Name varchar(30)   = NULL , 
@MktgFlag12Name varchar(30)   = NULL , 
@MktgFlag13Name varchar(30)   = NULL , 
@MktgFlag14Name varchar(30)   = NULL , 
@MktgFlag15Name varchar(30)   = NULL , 
@MinClockInTime datetime  = NULL , 
@MaxClockOutTime datetime  = NULL , 
@RoundUpProducts bit  = NULL , 
@COGSRedMargin float  = NULL , 
@COGSYellowMargin float  = NULL , 
@COGSGreenMargin float  = NULL , 
@EstClosing bit  = NULL , 
@DailyOTHours float  = NULL , 
@WeeklyOTHours float  = NULL , 
@MktgFlag16Name varchar(30)   = NULL , 
@MktgFlag17Name varchar(30)   = NULL , 
@MktgFlag18Name varchar(30)   = NULL , 
@MktgFlag19Name varchar(30)   = NULL , 
@MktgFlag20Name varchar(30)   = NULL , 
@MktgFlag21Name varchar(30)   = NULL , 
@MktgFlag22Name varchar(30)   = NULL , 
@MktgFlag23Name varchar(30)   = NULL , 
@MktgFlag24Name varchar(30)   = NULL , 
@MktgFlag25Name varchar(30)   = NULL , 
@DefaultOrderNotes varchar(MAX)   = NULL , 
@DefaultProductionNotes varchar(MAX)   = NULL , 
@URL varchar(50)   = NULL , 
@EstimateProjects varchar(MAX)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Store Information Database'
 
	 UPDATE [Store Information Database] 
	 SET   
		[CompanyName] = @CompanyName, 
		[Address] = @Address, 
		[City] = @City, 
		[State] = @State, 
		[Zip] = @Zip, 
		[County] = @County, 
		[Country] = @Country, 
		[Phone] = @Phone, 
		[Fax] = @Fax, 
		[EMailAddress] = @EMailAddress, 
		[DefaultAreaCode] = @DefaultAreaCode, 
		[DefaultLeadDays] = @DefaultLeadDays, 
		[DefaultDueTime] = @DefaultDueTime, 
		[MPW] = @MPW, 
		[TaxID] = @TaxID, 
		[ShopLaborRate] = @ShopLaborRate, 
		[FieldLaborRate] = @FieldLaborRate, 
		[MaterialMultiplier] = @MaterialMultiplier, 
		[InstallationTaxable] = @InstallationTaxable, 
		[Equipment1] = @Equipment1, 
		[Equipment2] = @Equipment2, 
		[Equipment3] = @Equipment3, 
		[EquipmentRate1] = @EquipmentRate1, 
		[EquipmentRate2] = @EquipmentRate2, 
		[EquipmentRate3] = @EquipmentRate3, 
		[EquipmentMinimum1] = @EquipmentMinimum1, 
		[EquipmentMinimum2] = @EquipmentMinimum2, 
		[EquipmentMinimum3] = @EquipmentMinimum3, 
		[ProductionLoc1] = @ProductionLoc1, 
		[ProductionLoc2] = @ProductionLoc2, 
		[ProductionLoc3] = @ProductionLoc3, 
		[InstallationEnabled] = @InstallationEnabled, 
		[AVIEnabled] = @AVIEnabled, 
		[ProdLocEnabled] = @ProdLocEnabled, 
		[PrintAVIs] = @PrintAVIs, 
		[PrintInstallation] = @PrintInstallation, 
		[StateSalesTaxRate] = @StateSalesTaxRate, 
		[CountySalesTaxRate] = @CountySalesTaxRate, 
		[StoreType] = @StoreType, 
		[ManagerID] = @ManagerID, 
		[OpenDate] = @OpenDate, 
		[Logo] = @Logo, 
		[StdTerms] = @StdTerms, 
		[TagLine] = @TagLine, 
		[EstGreeting] = @EstGreeting, 
		[PrintDepositReqd] = @PrintDepositReqd, 
		[DepositPercentage] = @DepositPercentage, 
		[EstIntroText] = @EstIntroText, 
		[Statement0to30] = @Statement0to30, 
		[Statement30to60] = @Statement30to60, 
		[Statement60to90] = @Statement60to90, 
		[StatementOver90] = @StatementOver90, 
		[TrackLunch] = @TrackLunch, 
		[AutoDecLunch] = @AutoDecLunch, 
		[STDLunchLength] = @STDLunchLength, 
		[OTOverEight] = @OTOverEight, 
		[OTOverTen] = @OTOverTen, 
		[OTOverForty] = @OTOverForty, 
		[ProductLaborRate] = @ProductLaborRate, 
		[ProductMaterialRate] = @ProductMaterialRate, 
		[FranchiseFee1] = @FranchiseFee1, 
		[FranchiseFee2] = @FranchiseFee2, 
		[FranchiseFee3] = @FranchiseFee3, 
		[AdvertisingFee1] = @AdvertisingFee1, 
		[AdvertisingFee2] = @AdvertisingFee2, 
		[AdvertisingFee3] = @AdvertisingFee3, 
		[OrdContactDays] = @OrdContactDays, 
		[EstContactDays] = @EstContactDays, 
		[ARContactDays] = @ARContactDays, 
		[BuiltContactDays] = @BuiltContactDays, 
		[DaysBetweenContacts] = @DaysBetweenContacts, 
		[InvoicePrefix] = @InvoicePrefix, 
		[SalesTax1Name] = @SalesTax1Name, 
		[SalesTax2Name] = @SalesTax2Name, 
		[ShippingTaxable] = @ShippingTaxable, 
		[RoyaltyBasedOn] = @RoyaltyBasedOn, 
		[AuditTrackingOn] = @AuditTrackingOn, 
		[InBeforeTime] = @InBeforeTime, 
		[SalesTaxRegion] = @SalesTaxRegion, 
		[MktgFlag1Name] = @MktgFlag1Name, 
		[MktgFlag2Name] = @MktgFlag2Name, 
		[MktgFlag3Name] = @MktgFlag3Name, 
		[MktgFlag4Name] = @MktgFlag4Name, 
		[MktgFlag5Name] = @MktgFlag5Name, 
		[CustomField1Name] = @CustomField1Name, 
		[CustomField1PickList] = @CustomField1PickList, 
		[CustomField1LimitToList] = @CustomField1LimitToList, 
		[CustomField2Name] = @CustomField2Name, 
		[CustomField2PickList] = @CustomField2PickList, 
		[CustomField2LimitToList] = @CustomField2LimitToList, 
		[CustomList1Name] = @CustomList1Name, 
		[CustomList2Name] = @CustomList2Name, 
		[DefaultInvoice] = @DefaultInvoice, 
		[DefaultEstimate] = @DefaultEstimate, 
		[DefaultWorkOrder] = @DefaultWorkOrder, 
		[DefaultStatement] = @DefaultStatement, 
		[DefaultWIP] = @DefaultWIP, 
		[DefaultRoyaltyReport] = @DefaultRoyaltyReport, 
		[CommissionBasedOn] = @CommissionBasedOn, 
		[DefaultReports] = @DefaultReports, 
		[AddressFormat] = @AddressFormat, 
		[Projects] = @Projects, 
		[NoInvoices] = @NoInvoices, 
		[NoEstimates] = @NoEstimates, 
		[Version] = @Version, 
		[OrderMinimum] = @OrderMinimum, 
		[DefaultProofDays] = @DefaultProofDays, 
		[MktgFlag6Name] = @MktgFlag6Name, 
		[MktgFlag7Name] = @MktgFlag7Name, 
		[MktgFlag8Name] = @MktgFlag8Name, 
		[MktgFlag9Name] = @MktgFlag9Name, 
		[MktgFlag10Name] = @MktgFlag10Name, 
		[MktgFlag11Name] = @MktgFlag11Name, 
		[MktgFlag12Name] = @MktgFlag12Name, 
		[MktgFlag13Name] = @MktgFlag13Name, 
		[MktgFlag14Name] = @MktgFlag14Name, 
		[MktgFlag15Name] = @MktgFlag15Name, 
		[MinClockInTime] = @MinClockInTime, 
		[MaxClockOutTime] = @MaxClockOutTime, 
		[RoundUpProducts] = @RoundUpProducts, 
		[COGSRedMargin] = @COGSRedMargin, 
		[COGSYellowMargin] = @COGSYellowMargin, 
		[COGSGreenMargin] = @COGSGreenMargin, 
		[EstClosing] = @EstClosing, 
		[DailyOTHours] = @DailyOTHours, 
		[WeeklyOTHours] = @WeeklyOTHours, 
		[MktgFlag16Name] = @MktgFlag16Name, 
		[MktgFlag17Name] = @MktgFlag17Name, 
		[MktgFlag18Name] = @MktgFlag18Name, 
		[MktgFlag19Name] = @MktgFlag19Name, 
		[MktgFlag20Name] = @MktgFlag20Name, 
		[MktgFlag21Name] = @MktgFlag21Name, 
		[MktgFlag22Name] = @MktgFlag22Name, 
		[MktgFlag23Name] = @MktgFlag23Name, 
		[MktgFlag24Name] = @MktgFlag24Name, 
		[MktgFlag25Name] = @MktgFlag25Name, 
		[DefaultOrderNotes] = @DefaultOrderNotes, 
		[DefaultProductionNotes] = @DefaultProductionNotes, 
		[URL] = @URL, 
		[EstimateProjects] = @EstimateProjects, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Store Information Database]( [ID], [StoreID], [CompanyName], [Address], [City], [State], [Zip], [County], [Country], [Phone], [Fax], [EMailAddress], [DefaultAreaCode], [DefaultLeadDays], [DefaultDueTime], [MPW], [TaxID], [ShopLaborRate], [FieldLaborRate], [MaterialMultiplier], [InstallationTaxable], [Equipment1], [Equipment2], [Equipment3], [EquipmentRate1], [EquipmentRate2], [EquipmentRate3], [EquipmentMinimum1], [EquipmentMinimum2], [EquipmentMinimum3], [ProductionLoc1], [ProductionLoc2], [ProductionLoc3], [InstallationEnabled], [AVIEnabled], [ProdLocEnabled], [PrintAVIs], [PrintInstallation], [StateSalesTaxRate], [CountySalesTaxRate], [StoreType], [ManagerID], [OpenDate], [Logo], [StdTerms], [TagLine], [EstGreeting], [PrintDepositReqd], [DepositPercentage], [EstIntroText], [Statement0to30], [Statement30to60], [Statement60to90], [StatementOver90], [TrackLunch], [AutoDecLunch], [STDLunchLength], [OTOverEight], [OTOverTen], [OTOverForty], [ProductLaborRate], [ProductMaterialRate], [FranchiseFee1], [FranchiseFee2], [FranchiseFee3], [AdvertisingFee1], [AdvertisingFee2], [AdvertisingFee3], [OrdContactDays], [EstContactDays], [ARContactDays], [BuiltContactDays], [DaysBetweenContacts], [InvoicePrefix], [SalesTax1Name], [SalesTax2Name], [ShippingTaxable], [RoyaltyBasedOn], [AuditTrackingOn], [InBeforeTime], [SalesTaxRegion], [MktgFlag1Name], [MktgFlag2Name], [MktgFlag3Name], [MktgFlag4Name], [MktgFlag5Name], [CustomField1Name], [CustomField1PickList], [CustomField1LimitToList], [CustomField2Name], [CustomField2PickList], [CustomField2LimitToList], [CustomList1Name], [CustomList2Name], [DefaultInvoice], [DefaultEstimate], [DefaultWorkOrder], [DefaultStatement], [DefaultWIP], [DefaultRoyaltyReport], [CommissionBasedOn], [DefaultReports], [AddressFormat], [Projects], [NoInvoices], [NoEstimates], [Version], [OrderMinimum], [DefaultProofDays], [MktgFlag6Name], [MktgFlag7Name], [MktgFlag8Name], [MktgFlag9Name], [MktgFlag10Name], [MktgFlag11Name], [MktgFlag12Name], [MktgFlag13Name], [MktgFlag14Name], [MktgFlag15Name], [MinClockInTime], [MaxClockOutTime], [RoundUpProducts], [COGSRedMargin], [COGSYellowMargin], [COGSGreenMargin], [EstClosing], [DailyOTHours], [WeeklyOTHours], [MktgFlag16Name], [MktgFlag17Name], [MktgFlag18Name], [MktgFlag19Name], [MktgFlag20Name], [MktgFlag21Name], [MktgFlag22Name], [MktgFlag23Name], [MktgFlag24Name], [MktgFlag25Name], [DefaultOrderNotes], [DefaultProductionNotes], [URL], [EstimateProjects], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @CompanyName, @Address, @City, @State, @Zip, @County, @Country, @Phone, @Fax, @EMailAddress, @DefaultAreaCode, @DefaultLeadDays, @DefaultDueTime, @MPW, @TaxID, @ShopLaborRate, @FieldLaborRate, @MaterialMultiplier, @InstallationTaxable, @Equipment1, @Equipment2, @Equipment3, @EquipmentRate1, @EquipmentRate2, @EquipmentRate3, @EquipmentMinimum1, @EquipmentMinimum2, @EquipmentMinimum3, @ProductionLoc1, @ProductionLoc2, @ProductionLoc3, @InstallationEnabled, @AVIEnabled, @ProdLocEnabled, @PrintAVIs, @PrintInstallation, @StateSalesTaxRate, @CountySalesTaxRate, @StoreType, @ManagerID, @OpenDate, @Logo, @StdTerms, @TagLine, @EstGreeting, @PrintDepositReqd, @DepositPercentage, @EstIntroText, @Statement0to30, @Statement30to60, @Statement60to90, @StatementOver90, @TrackLunch, @AutoDecLunch, @STDLunchLength, @OTOverEight, @OTOverTen, @OTOverForty, @ProductLaborRate, @ProductMaterialRate, @FranchiseFee1, @FranchiseFee2, @FranchiseFee3, @AdvertisingFee1, @AdvertisingFee2, @AdvertisingFee3, @OrdContactDays, @EstContactDays, @ARContactDays, @BuiltContactDays, @DaysBetweenContacts, @InvoicePrefix, @SalesTax1Name, @SalesTax2Name, @ShippingTaxable, @RoyaltyBasedOn, @AuditTrackingOn, @InBeforeTime, @SalesTaxRegion, @MktgFlag1Name, @MktgFlag2Name, @MktgFlag3Name, @MktgFlag4Name, @MktgFlag5Name, @CustomField1Name, @CustomField1PickList, @CustomField1LimitToList, @CustomField2Name, @CustomField2PickList, @CustomField2LimitToList, @CustomList1Name, @CustomList2Name, @DefaultInvoice, @DefaultEstimate, @DefaultWorkOrder, @DefaultStatement, @DefaultWIP, @DefaultRoyaltyReport, @CommissionBasedOn, @DefaultReports, @AddressFormat, @Projects, @NoInvoices, @NoEstimates, @Version, @OrderMinimum, @DefaultProofDays, @MktgFlag6Name, @MktgFlag7Name, @MktgFlag8Name, @MktgFlag9Name, @MktgFlag10Name, @MktgFlag11Name, @MktgFlag12Name, @MktgFlag13Name, @MktgFlag14Name, @MktgFlag15Name, @MinClockInTime, @MaxClockOutTime, @RoundUpProducts, @COGSRedMargin, @COGSYellowMargin, @COGSGreenMargin, @EstClosing, @DailyOTHours, @WeeklyOTHours, @MktgFlag16Name, @MktgFlag17Name, @MktgFlag18Name, @MktgFlag19Name, @MktgFlag20Name, @MktgFlag21Name, @MktgFlag22Name, @MktgFlag23Name, @MktgFlag24Name, @MktgFlag25Name, @DefaultOrderNotes, @DefaultProductionNotes, @URL, @EstimateProjects, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
