/****** Object:  Table [dbo].[Store Information Database]    Script Date: 5/15/2018 12:01:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Store Information Database](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[CompanyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultAreaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultLeadDays] [smallint] NULL,
	[DefaultDueTime] [datetime] NULL,
	[MPW] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxID] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShopLaborRate] [money] NULL,
	[FieldLaborRate] [money] NULL,
	[MaterialMultiplier] [float] NULL,
	[InstallationTaxable] [bit] NULL,
	[Equipment1] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Equipment2] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Equipment3] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EquipmentRate1] [money] NULL,
	[EquipmentRate2] [money] NULL,
	[EquipmentRate3] [money] NULL,
	[EquipmentMinimum1] [money] NULL,
	[EquipmentMinimum2] [money] NULL,
	[EquipmentMinimum3] [money] NULL,
	[ProductionLoc1] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionLoc2] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionLoc3] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstallationEnabled] [bit] NULL,
	[AVIEnabled] [bit] NULL,
	[ProdLocEnabled] [bit] NULL,
	[PrintAVIs] [bit] NULL,
	[PrintInstallation] [bit] NULL,
	[StateSalesTaxRate] [float] NULL,
	[CountySalesTaxRate] [float] NULL,
	[StoreType] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ManagerID] [int] NULL,
	[OpenDate] [datetime] NULL,
	[Logo] [image] NULL,
	[StdTerms] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TagLine] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EstGreeting] [bit] NULL,
	[PrintDepositReqd] [bit] NULL,
	[DepositPercentage] [float] NULL,
	[EstIntroText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Statement0to30] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Statement30to60] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Statement60to90] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatementOver90] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrackLunch] [bit] NULL,
	[AutoDecLunch] [bit] NULL,
	[STDLunchLength] [smallint] NULL,
	[OTOverEight] [bit] NULL,
	[OTOverTen] [bit] NULL,
	[OTOverForty] [bit] NULL,
	[ProductLaborRate] [money] NULL,
	[ProductMaterialRate] [float] NULL,
	[FranchiseFee1] [float] NULL,
	[FranchiseFee2] [float] NULL,
	[FranchiseFee3] [float] NULL,
	[AdvertisingFee1] [float] NULL,
	[AdvertisingFee2] [float] NULL,
	[AdvertisingFee3] [float] NULL,
	[OrdContactDays] [int] NULL,
	[EstContactDays] [int] NULL,
	[ARContactDays] [int] NULL,
	[BuiltContactDays] [int] NULL,
	[DaysBetweenContacts] [int] NULL,
	[InvoicePrefix] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesTax1Name] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesTax2Name] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingTaxable] [bit] NULL,
	[RoyaltyBasedOn] [int] NULL,
	[AuditTrackingOn] [bit] NULL,
	[InBeforeTime] [datetime] NULL,
	[SalesTaxRegion] [int] NULL,
	[MktgFlag1Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag2Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag3Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag4Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag5Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomField1Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomField1PickList] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomField1LimitToList] [bit] NULL,
	[CustomField2Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomField2PickList] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomField2LimitToList] [bit] NULL,
	[CustomList1Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomList2Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultInvoice] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultEstimate] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultWorkOrder] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultStatement] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultWIP] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultRoyaltyReport] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommissionBasedOn] [int] NULL,
	[DefaultReports] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressFormat] [int] NULL,
	[Projects] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NoInvoices] [int] NULL,
	[NoEstimates] [int] NULL,
	[Version] [float] NULL,
	[OrderMinimum] [money] NULL,
	[DefaultProofDays] [int] NULL,
	[MktgFlag6Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag7Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag8Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag9Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag10Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag11Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag12Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag13Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag14Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag15Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MinClockInTime] [datetime] NULL,
	[MaxClockOutTime] [datetime] NULL,
	[RoundUpProducts] [bit] NULL,
	[COGSRedMargin] [float] NULL,
	[COGSYellowMargin] [float] NULL,
	[COGSGreenMargin] [float] NULL,
	[EstClosing] [bit] NULL,
	[DailyOTHours] [float] NULL,
	[WeeklyOTHours] [float] NULL,
	[MktgFlag16Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag17Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag18Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag19Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag20Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag21Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag22Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag23Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag24Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgFlag25Name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[DefaultOrderNotes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultProductionNotes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EstimateProjects] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
