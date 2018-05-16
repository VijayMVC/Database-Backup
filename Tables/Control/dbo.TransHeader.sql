/****** Object:  Table [dbo].[TransHeader]    Script Date: 5/15/2018 11:58:58 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TransHeader](
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
	[EstimateNumber] [int] NULL,
	[OrderNumber] [int] NULL,
	[OrderTemplateNumber] [int] NULL,
	[Version] [int] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [int] NULL,
	[AccountStoreID] [int] NULL,
	[ContactID] [int] NULL,
	[SalesPerson1ID] [int] NULL,
	[SalesPerson2ID] [int] NULL,
	[SalesPerson3ID] [int] NULL,
	[OrderNotes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PONumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionNotes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingLevel] [float] NULL,
	[PricingLevelOverridden] [bit] NULL,
	[DiscountLevel] [float] NULL,
	[DiscountLevelOverridden] [bit] NULL,
	[EstimateCreatedDate] [datetime] NULL,
	[OrderCreatedDate] [datetime] NULL,
	[BuiltDate] [datetime] NULL,
	[SaleDate] [datetime] NULL,
	[ClosedDate] [datetime] NULL,
	[VoidedDate] [datetime] NULL,
	[ConvertedDate] [datetime] NULL,
	[RejectedDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ProofDate] [datetime] NULL,
	[LastFinanceChargeDate] [datetime] NULL,
	[DispositionID] [int] NULL,
	[SalesDispositionID] [int] NULL,
	[EnteredByID] [int] NULL,
	[HTMLShortFormat] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTMLLongFormat] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BasePrice] [decimal](18, 4) NULL,
	[DiscountPrice] [decimal](18, 4) NULL,
	[ModifierPrice] [decimal](18, 4) NULL,
	[RawSubTotalPrice] [decimal](18, 4) NULL,
	[RoundingPrice] [decimal](18, 4) NULL,
	[SubTotalPrice] [decimal](18, 4) NULL,
	[TaxesPrice] [decimal](18, 4) NULL,
	[TotalPrice] [decimal](18, 4) NULL,
	[SonsBasePrice] [decimal](18, 4) NULL,
	[SonsDiscountPrice] [decimal](18, 4) NULL,
	[SonsModifierPrice] [decimal](18, 4) NULL,
	[SonsRawSubTotalPrice] [decimal](18, 4) NULL,
	[SonsRoundingPrice] [decimal](18, 4) NULL,
	[SonsSubTotalPrice] [decimal](18, 4) NULL,
	[SonsTaxesPrice] [decimal](18, 4) NULL,
	[SonsTotalPrice] [decimal](18, 4) NULL,
	[FinanceChargeAmount] [decimal](18, 4) NULL,
	[BalanceDue] [decimal](18, 4) NULL,
	[PaymentTotal] [decimal](18, 4) NULL,
	[WriteOffAmount] [decimal](18, 4) NULL,
	[StatusID] [int] NULL,
	[StatusText] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxClassID] [int] NULL,
	[TaxClassOverridden] [bit] NULL,
	[InvoiceAddressID] [int] NULL,
	[InvoiceAddressOverridden] [bit] NULL,
	[InvoiceContactID] [int] NULL,
	[ShippingAddressID] [int] NULL,
	[ShippingAddressOverridden] [bit] NULL,
	[ShippingContactID] [int] NULL,
	[InvoiceAddressLinkID] [int] NULL,
	[ShippingAddressLinkID] [int] NULL,
	[EstimateGreeting] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EstimateGreetingTemplate] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsTaxExempt] [bit] NULL,
	[TaxNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderOriginID] [int] NULL,
	[OrderOriginName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ManuallyReOpened] [bit] NULL,
	[CreditMemoAmount] [float] NULL,
	[CreditMemoOrderID] [int] NULL,
	[NextRefNumber] [int] NULL,
	[PricingLevelID] [int] NULL,
	[PromotionID] [int] NULL,
	[UseTaxLookup] [bit] NULL,
	[TaxItems] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceNumber] [int] NULL,
	[ServiceTicketNumber] [int] NULL,
	[DivisionID] [int] NULL,
	[DivisionIDOverridden] [bit] NULL,
	[OrderNotesTemplate] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionNotesTemplate] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFirmDueDate] [bit] NULL,
	[ShippingCompanyID] [int] NULL,
	[ShippingCompanyOV] [bit] NULL,
	[ShippingContactOV] [bit] NULL,
	[InvoiceCompanyID] [int] NULL,
	[InvoiceCompanyOV] [bit] NULL,
	[InvoiceContactOV] [bit] NULL,
	[UseProgressBilling] [bit] NULL,
	[PercentComplete] [float] NULL,
	[RecurrenceType] [int] NULL,
	[RecurrenceEndDate] [datetime] NULL,
	[LastRecurrence] [datetime] NULL,
	[ScheduledPaymentPlanID] [int] NULL,
	[ScheduledPaymentDate] [datetime] NULL,
	[ScheduledPayments] [int] NULL,
	[ScheduledPaymentIntervals] [int] NULL,
	[UsePaymentPlan] [bit] NULL,
	[DroppedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TransHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
