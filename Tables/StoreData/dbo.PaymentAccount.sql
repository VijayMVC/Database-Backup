/****** Object:  Table [dbo].[PaymentAccount]    Script Date: 5/15/2018 12:06:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PaymentAccount](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[MaxChange] [decimal](18, 4) NULL,
	[DiscountRate] [decimal](18, 4) NULL,
	[ReturnDiscountRate] [decimal](18, 4) NULL,
	[CanGiveCashBack] [bit] NULL,
	[CreditCardType] [int] NULL,
	[TenderType] [int] NULL,
	[ImageID] [int] NULL,
	[AccountName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsProcessed] [bit] NULL,
	[BankAccountID] [int] NULL,
	[AllowOverPayToCredit] [bit] NULL,
 CONSTRAINT [PaymentAccount_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_PaymentAccount_TenderType]    Script Date: 5/15/2018 12:06:50 PM ******/
CREATE NONCLUSTERED INDEX [Index_PaymentAccount_TenderType] ON [dbo].[PaymentAccount]
(
	[TenderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_PaymentAccount]    Script Date: 5/15/2018 12:06:50 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_PaymentAccount] ON [dbo].[PaymentAccount]
(
	[CreditCardType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
