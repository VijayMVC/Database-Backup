/****** Object:  Table [dbo].[AccountContact]    Script Date: 5/15/2018 12:06:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AccountContact](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Position] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MainPhoneNumberID] [int] NULL,
	[MainFaxNumberID] [int] NULL,
	[AccountID] [int] NULL,
	[IsPrimaryContact] [bit] NULL,
	[IsAccountingContact] [bit] NULL,
	[BillingAddressID] [int] NULL,
	[ShippingAddressID] [int] NULL,
	[BirthDateMonth] [int] NULL,
	[BirthDateDay] [int] NULL,
	[DefaultPaymentExpDate] [datetime] NULL,
	[DefaultPaymentTrackingNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentNameOnCard] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentTypeID] [int] NULL,
	[CCBillingAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentVCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [int] NULL,
	[SalespersonID1] [int] NULL,
	[SalespersonID2] [int] NULL,
	[SalespersonID3] [int] NULL,
	[UseCompanySalespeople] [bit] NULL,
	[IsCCNumEncrypt] [bit] NULL,
	[DisplayNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BirthDate] [datetime] NULL,
	[IsVCodeEncrypted] [bit] NULL,
	[PrimaryNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriNumberTypeID] [int] NULL,
	[PriNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecNumberTypeID] [int] NULL,
	[SecNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentAddressID] [int] NULL,
	[CCSwiped] [bit] NULL,
	[SendBillingAddress] [bit] NULL,
	[IDNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImageID] [int] NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactType] [int] NULL,
	[GenderType] [int] NULL,
	[NumOfMakeups] [int] NULL,
	[ThirdNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ThirdNumberTypeID] [int] NULL,
	[ThirdNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentBankReference] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentBankCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentBranchCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentCIN] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentState] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentCCAccount] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentAddressLinkID] [int] NULL,
	[CCCSCustomerGuid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseShippingAccountInfo] [bit] NULL,
	[DefaultShippingAccountNumber] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultShippingCarrierID] [int] NULL,
	[DefaultShippingCarrierClassTypeID] [int] NULL,
	[DefaultShippingAccountPostalCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingMethodLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentAddressOV] [bit] NULL,
 CONSTRAINT [AccountContact_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_AccountContact_BillingAddressID]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_AccountContact_BillingAddressID] ON [dbo].[AccountContact]
(
	[BillingAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_AccountContact_DefaultPaymentTypeID]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_AccountContact_DefaultPaymentTypeID] ON [dbo].[AccountContact]
(
	[DefaultPaymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_AccountContact_MainPhoneNumberID]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_AccountContact_MainPhoneNumberID] ON [dbo].[AccountContact]
(
	[MainPhoneNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_AccountContact_ShippingAddressID]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_AccountContact_ShippingAddressID] ON [dbo].[AccountContact]
(
	[ShippingAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IndexAccountCotactBillingAddressID]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [IndexAccountCotactBillingAddressID] ON [dbo].[AccountContact]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
