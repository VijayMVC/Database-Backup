/****** Object:  Table [dbo].[TransDetail]    Script Date: 5/15/2018 12:06:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TransDetail](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[TransactionType] [int] NULL,
	[ParentID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[TransHeaderID] [int] NULL,
	[TransHeaderClassTypeID] [int] NULL,
	[TransHeaderTransNumber] [int] NULL,
	[GoodsItemID] [int] NULL,
	[GoodsItemClassTypeID] [int] NULL,
	[GoodsItemCode] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingLevel] [float] NULL,
	[PricingLevelOverridden] [bit] NULL,
	[DiscountLevel] [float] NULL,
	[DiscountLevelOverridden] [bit] NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [float] NULL,
	[LineItemIndex] [int] NULL,
	[LineItemNumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTMLShortFormat] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTMLLongFormat] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BasePrice] [decimal](18, 4) NULL,
	[BaseCalcPrice] [decimal](18, 4) NULL,
	[BaseOverriddenPrice] [decimal](18, 4) NULL,
	[BaseIsOverridden] [bit] NULL,
	[DiscountPrice] [decimal](18, 4) NULL,
	[DiscountCalcPrice] [decimal](18, 4) NULL,
	[DiscountOverriddenPrice] [decimal](18, 4) NULL,
	[DiscountIsOverridden] [bit] NULL,
	[ModifierPrice] [decimal](18, 4) NULL,
	[ModifierCalcPrice] [decimal](18, 4) NULL,
	[ModifierOverriddenPrice] [decimal](18, 4) NULL,
	[ModifierIsOverridden] [bit] NULL,
	[RawSubTotalPrice] [decimal](18, 4) NULL,
	[RawSubTotalCalcPrice] [decimal](18, 4) NULL,
	[RawSubTotalOverriddenPrice] [decimal](18, 4) NULL,
	[RawSubTotalIsOverridden] [bit] NULL,
	[RoundingPrice] [decimal](18, 4) NULL,
	[RoundingCalcPrice] [decimal](18, 4) NULL,
	[RoundingOverriddenPrice] [decimal](18, 4) NULL,
	[RoundingIsOverridden] [bit] NULL,
	[SubTotalPrice] [decimal](18, 4) NULL,
	[SubTotalCalcPrice] [decimal](18, 4) NULL,
	[SubTotalOverriddenPrice] [decimal](18, 4) NULL,
	[SubTotalIsOverridden] [bit] NULL,
	[TaxesPrice] [decimal](18, 4) NULL,
	[TaxesCalcPrice] [decimal](18, 4) NULL,
	[TaxesOverriddenPrice] [decimal](18, 4) NULL,
	[TaxesIsOverridden] [bit] NULL,
	[TotalPrice] [decimal](18, 4) NULL,
	[TotalCalcPrice] [decimal](18, 4) NULL,
	[TotalOverriddenPrice] [decimal](18, 4) NULL,
	[TotalIsOverridden] [bit] NULL,
	[MeAndSonsBasePrice] [decimal](18, 4) NULL,
	[MeAndSonsDiscountPrice] [decimal](18, 4) NULL,
	[MeAndSonsModifierPrice] [decimal](18, 4) NULL,
	[MeAndSonsRawSubTotalPrice] [decimal](18, 4) NULL,
	[MeAndSonsRoundingPrice] [decimal](18, 4) NULL,
	[MeAndSonsSubTotalPrice] [decimal](18, 4) NULL,
	[MeAndSonsTaxesPrice] [decimal](18, 4) NULL,
	[MeAndSonsTotalPrice] [decimal](18, 4) NULL,
	[InternalNotes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnitParamName] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnitParamValue] [float] NULL,
	[VariationID] [int] NULL,
	[ImageParamID] [int] NULL,
	[ImageParamStoreID] [int] NULL,
	[ImageParamClassTypeID] [int] NULL,
	[StageID] [int] NULL,
	[StageStoreID] [int] NULL,
	[StageClassTypeID] [int] NULL,
	[SaleAccountID] [int] NULL,
	[SaleAccountStoreID] [int] NULL,
	[SaleAccountClassTypeID] [int] NULL,
	[SaleAccountOverridden] [bit] NULL,
	[ChildItemCount] [int] NULL,
	[TaxItems] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParameterStr] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifierStr] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartStr] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VarGridParam1ID] [int] NULL,
	[VarGridParam2ID] [int] NULL,
	[VarGridValues1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VarGridValues2] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VarGridParam1OV] [bit] NULL,
	[VarGridParam2OV] [bit] NULL,
	[IsComplete] [bit] NULL,
	[AssignedToID] [int] NULL,
	[TicketItemNumber] [int] NULL,
	[ShippingCompanyID] [int] NULL,
	[ShippingCompanyOV] [bit] NULL,
	[ShippingContactID] [int] NULL,
	[ShippingContactOV] [bit] NULL,
	[ShippingAddressID] [int] NULL,
	[ShippingAddressLinkID] [int] NULL,
	[ShippingAddressOV] [bit] NULL,
	[ShippingTaxClassID] [int] NULL,
	[ShippingTaxClassOV] [bit] NULL,
	[TotMaterialCost] [float] NULL,
	[TotLaborCost] [float] NULL,
	[TotEquipmentCost] [float] NULL,
	[TotOutSourceCost] [float] NULL,
	[TotOtherCost] [float] NULL,
	[TotPartCost] [float] NULL,
	[HasWorkAssignment] [bit] NULL,
	[WorkAssignmentID] [int] NULL,
	[WorkAssignmentStoreID] [int] NULL,
	[WorkAssignmentClassTypeID] [int] NULL,
	[TotFreightCost] [float] NULL,
	[PriorityID] [int] NULL,
	[PriorityStoreID] [int] NULL,
	[PriorityClassTypeID] [int] NULL,
	[AssignedToClassTypeID] [int] NULL,
	[ProofApproved] [bit] NULL,
	[ProofApprovedDate] [datetime] NULL,
	[ProofApprovedByID] [int] NULL,
	[PercentComplete] [float] NULL,
	[PercentCompleteOV] [bit] NULL,
	[TermID] [int] NULL,
	[ContractPeriodID] [int] NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractEndDate] [datetime] NULL,
	[ShipFromAddressID] [int] NULL,
	[ShipFromAddressLinkID] [int] NULL,
	[ShipFromAddressOV] [bit] NULL,
	[IsValidTax] [bit] NULL,
	[TaxNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipFromID] [int] NULL,
	[ShipFromClassTypeID] [int] NULL,
	[AssemblyIncluded] [bit] NULL,
	[AssemblyIncludedOV] [bit] NULL,
	[AssemblyLocked] [bit] NULL,
	[AssemblyLinkID] [int] NULL,
	[AssemblyLinkClassTypeID] [int] NULL,
	[OverriddenAssemblies] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[GLDepartmentID] [int] NULL,
	[GLDepartmentIDOV] [bit] NULL,
	[TaxablePrice] [float] NULL,
	[MeAndSonsTaxablePrice] [float] NULL,
	[StationActivityID] [int] NULL,
	[StationActivityClassTypeID] [int] NULL,
	[MaterialExpenseID] [int] NULL,
	[LaborExpenseID] [int] NULL,
	[EquipmentExpenseID] [int] NULL,
	[OutsourceExpenseID] [int] NULL,
	[OtherExpenseID] [int] NULL,
	[FreightExpenseID] [int] NULL,
	[LocationExpenseID] [int] NULL,
	[UseParentExpenseAccounts] [bit] NULL,
	[WarehouseID] [int] NULL,
	[WarehouseIDOV] [bit] NULL,
	[RanReturnSQLFuncStatements] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QuantityShipped] [float] NULL,
	[DueDate] [datetime] NULL,
	[DueDateOV] [bit] NULL,
	[ShipFromCustomerID] [int] NULL,
	[ShipFromCustomerClassTypeID] [int] NULL,
	[ShowMultipleQuantityGrid] [bit] NULL,
	[MultipleQuantityGridXML] [xml] NULL,
 CONSTRAINT [TransDetail_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_TransDetail_AssignedToID]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_AssignedToID] ON [dbo].[TransDetail]
(
	[AssignedToID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShipFromAddressIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShipFromAddressIndex] ON [dbo].[TransDetail]
(
	[ShipFromAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShipFromAddressLinkIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShipFromAddressLinkIndex] ON [dbo].[TransDetail]
(
	[ShipFromAddressLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShipFromIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShipFromIndex] ON [dbo].[TransDetail]
(
	[ShipFromID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShippingAddressIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShippingAddressIndex] ON [dbo].[TransDetail]
(
	[ShippingAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShippingAddressLinkIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShippingAddressLinkIndex] ON [dbo].[TransDetail]
(
	[ShippingAddressLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShippingCompanyIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShippingCompanyIndex] ON [dbo].[TransDetail]
(
	[ShippingCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShippingContactIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShippingContactIndex] ON [dbo].[TransDetail]
(
	[ShippingContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_ShippingTaxClassIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_ShippingTaxClassIndex] ON [dbo].[TransDetail]
(
	[ShippingTaxClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_Station]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_Station] ON [dbo].[TransDetail]
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_TermID]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_TermID] ON [dbo].[TransDetail]
(
	[TermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransDetail_TicketItemNumber]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransDetail_TicketItemNumber] ON [dbo].[TransDetail]
(
	[TicketItemNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransDetailLineItemIndexIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [TransDetailLineItemIndexIndex] ON [dbo].[TransDetail]
(
	[LineItemIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransDetailParentIDIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [TransDetailParentIDIndex] ON [dbo].[TransDetail]
(
	[ParentID] ASC,
	[StoreID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransDetailTransHeaderIDIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [TransDetailTransHeaderIDIndex] ON [dbo].[TransDetail]
(
	[TransHeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransDetailVariationIDIndex]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [TransDetailVariationIDIndex] ON [dbo].[TransDetail]
(
	[VariationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
