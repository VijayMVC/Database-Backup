/****** Object:  Table [Orders].[OrderDetailFact]    Script Date: 5/15/2018 11:59:36 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[OrderDetailFact](
	[OrderDetailKey] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderID] [int] NULL,
	[OrderHeaderKey] [int] NULL,
	[LineItemNumber] [int] NULL,
	[ProductID] [int] NULL,
	[ProductKey] [int] NULL,
	[ProductCodeKey] [int] NULL,
	[Quantity] [float] NULL,
	[Sides] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[ForegroundColorKey] [int] NULL,
	[BackgroundColorKey] [int] NULL,
	[FontKey] [int] NULL,
	[BasePrice] [money] NULL,
	[BasePriceOverriden] [bit] NULL,
	[BasePriceCalculated] [money] NULL,
	[AVTotal] [money] NULL,
	[InstallAmount] [money] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountPercentage] [float] NULL,
	[ItemTotal] [money] NULL,
	[UnitPriceOverridden] [bit] NULL,
	[OverRidden] [bit] NULL,
	[ItemTotalCalculated] [money] NULL,
	[Taxable] [bit] NULL,
	[AllInstallation] [bit] NULL,
	[DescriptionKey] [int] NULL,
	[SignTextKey] [int] NULL,
	[AVAdditionalAmt] [money] NULL,
	[AVAdditionalDescriptionKey] [int] NULL,
	[AVOverridden] [bit] NULL,
	[AVCalculated] [money] NULL,
	[ProductionLocation] [int] NULL,
	[ShopTime] [float] NULL,
	[FieldTime] [float] NULL,
	[FieldCrewSize] [float] NULL,
	[MaterialCost] [money] NULL,
	[HeightAboveGround] [float] NULL,
	[ProductionCat3Sales] [money] NULL,
	[OtherInstallConsideration] [money] NULL,
	[SpecialEquipment1] [bit] NULL,
	[SpecialEquipment2] [bit] NULL,
	[SpecialEquipment3] [bit] NULL,
	[SpecialEquipmentOther] [bit] NULL,
	[SpecialEquipmentOtherAmou] [money] NULL,
	[EstimatedInstallCharge] [money] NULL,
	[AccountCode] [int] NULL,
	[Hidden] [bit] NULL,
	[PMsAnswered] [bit] NULL,
	[ParentItemNumber] [int] NULL,
	[StateSalesTax] [money] NULL,
	[StateSalesTaxRate] [float] NULL,
	[ChildLevel] [int] NULL,
	[BaseCost] [money] NULL,
	[ProductionNotesKey] [int] NULL,
	[HasChildren] [bit] NULL,
	[BaseSonsPrice] [float] NULL,
	[BaseMeAndSonsPrice] [float] NULL,
	[InstallSonsPrice] [float] NULL,
	[InstallMeAndSonsPrice] [float] NULL,
	[DiscountSonsPrice] [float] NULL,
	[DiscountMeAndSonsPrice] [float] NULL,
	[ItemTotalSonsPrice] [float] NULL,
	[ItemTotalMeAndSonsPrice] [float] NULL,
	[RoyaltyGroupID] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL,
 CONSTRAINT [PK_OrderDetailFact] PRIMARY KEY NONCLUSTERED 
(
	[OrderDetailKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_OrderDetailFact]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE CLUSTERED INDEX [IX_OrderDetailFact] ON [Orders].[OrderDetailFact]
(
	[OrderDetailKey] ASC,
	[OLTP_InsertDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_Deleted_Lsinting]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_Deleted_Lsinting] ON [Orders].[OrderDetailFact]
(
	[ZW_Franchise_ID] ASC,
	[OrderID] ASC
)
INCLUDE ( 	[OrderDetailKey],
	[OrderDetailID],
	[LineItemNumber],
	[OLTP_UpdateDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_Deletes_OrderDeatilFact]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_Deletes_OrderDeatilFact] ON [Orders].[OrderDetailFact]
(
	[OrderDetailID] ASC,
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[OrderDetailKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_Dup_Check_Details]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_Dup_Check_Details] ON [Orders].[OrderDetailFact]
(
	[OrderHeaderKey] ASC
)
INCLUDE ( 	[OrderDetailKey],
	[OrderDetailID],
	[ZW_Franchise_ID],
	[OrderID],
	[LineItemNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_OrderDetailFact_ZW_Franchise_ID_inc_OrderID_ProductID_ItemTotal]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_OrderDetailFact_ZW_Franchise_ID_inc_OrderID_ProductID_ItemTotal] ON [Orders].[OrderDetailFact]
(
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[OrderID],
	[ProductID],
	[ItemTotal]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_OrderDetailFact_CenterKey_includes]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [idx_OrderDetailFact_CenterKey_includes] ON [Orders].[OrderDetailFact]
(
	[CenterKey] ASC
)
INCLUDE ( 	[OrderDetailKey],
	[OrderDetailID],
	[ZW_Franchise_ID],
	[OrderID],
	[OrderHeaderKey],
	[LineItemNumber],
	[ProductID],
	[ProductKey],
	[ProductCodeKey],
	[Quantity],
	[Sides],
	[Height],
	[Width],
	[ForegroundColorKey],
	[BackgroundColorKey],
	[FontKey],
	[BasePrice],
	[BasePriceOverriden],
	[BasePriceCalculated],
	[AVTotal],
	[InstallAmount],
	[DiscountAmount],
	[DiscountPercentage],
	[ItemTotal],
	[UnitPriceOverridden],
	[OverRidden],
	[ItemTotalCalculated],
	[Taxable],
	[AllInstallation],
	[DescriptionKey],
	[SignTextKey],
	[AVAdditionalAmt],
	[AVAdditionalDescriptionKey],
	[AVOverridden],
	[AVCalculated],
	[ProductionLocation],
	[ShopTime],
	[FieldTime],
	[FieldCrewSize],
	[MaterialCost],
	[HeightAboveGround],
	[ProductionCat3Sales],
	[OtherInstallConsideration],
	[SpecialEquipment1],
	[SpecialEquipment2],
	[SpecialEquipment3],
	[SpecialEquipmentOther],
	[SpecialEquipmentOtherAmou],
	[EstimatedInstallCharge],
	[AccountCode],
	[Hidden],
	[PMsAnswered],
	[ParentItemNumber],
	[StateSalesTax],
	[StateSalesTaxRate],
	[ChildLevel],
	[BaseCost],
	[ProductionNotesKey],
	[HasChildren],
	[BaseSonsPrice],
	[BaseMeAndSonsPrice],
	[InstallSonsPrice],
	[InstallMeAndSonsPrice],
	[DiscountSonsPrice],
	[DiscountMeAndSonsPrice],
	[ItemTotalSonsPrice],
	[ItemTotalMeAndSonsPrice],
	[RoyaltyGroupID],
	[OLTP_InsertDate],
	[OLTP_UpdateDate],
	[UpdateCheckSum]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 99) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [ZW_Franchise_ID_inc_OrderHeaderKey_ProductKey_ItemTotal]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [ZW_Franchise_ID_inc_OrderHeaderKey_ProductKey_ItemTotal] ON [Orders].[OrderDetailFact]
(
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[OrderHeaderKey],
	[ProductKey],
	[ItemTotal]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Orders].[OrderDetailFact] ADD  CONSTRAINT [DF_OrderDetailFact_OrderHeaderKey]  DEFAULT ((-255)) FOR [OrderHeaderKey]
ALTER TABLE [Orders].[OrderDetailFact] ADD  CONSTRAINT [DF_OrderDetailFact_ProductKey]  DEFAULT ((-255)) FOR [ProductKey]
ALTER TABLE [Orders].[OrderDetailFact] ADD  CONSTRAINT [DF_OrderDetailFact_CenterKey]  DEFAULT ((-255)) FOR [CenterKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_AVAdditionalDescriptionKey] FOREIGN KEY([AVAdditionalDescriptionKey])
REFERENCES [Orders].[AVAdditionalDescriptionDim] ([AVAdditionalDescriptionKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_AVAdditionalDescriptionKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_BackgroundColorKey] FOREIGN KEY([BackgroundColorKey])
REFERENCES [Orders].[BackgroundColorDim] ([BackgroundColorKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_BackgroundColorKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_DescriptionKey] FOREIGN KEY([DescriptionKey])
REFERENCES [Orders].[DescriptionDim] ([DescriptionKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_DescriptionKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_FontKey] FOREIGN KEY([FontKey])
REFERENCES [Orders].[FontDim] ([FontKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_FontKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_ForegroundColorKey] FOREIGN KEY([ForegroundColorKey])
REFERENCES [Orders].[ForegroundColorDim] ([ForegroundColorKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_ForegroundColorKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_ProductCodeKey] FOREIGN KEY([ProductCodeKey])
REFERENCES [Orders].[ProductCodeDim] ([ProductCodeKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_ProductCodeKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_ProductionNotesKey] FOREIGN KEY([ProductionNotesKey])
REFERENCES [Orders].[ProductionNotesDim] ([ProductionNotesKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_ProductionNotesKey]
ALTER TABLE [Orders].[OrderDetailFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderDetailFact_SignTextKey] FOREIGN KEY([SignTextKey])
REFERENCES [Orders].[SignTextDim] ([SignTextKey])
ALTER TABLE [Orders].[OrderDetailFact] CHECK CONSTRAINT [FK_OrderDetailFact_SignTextKey]
GO
