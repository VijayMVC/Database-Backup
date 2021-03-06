/****** Object:  Table [dbo].[TransTax]    Script Date: 5/15/2018 12:07:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TransTax](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[TransHeaderID] [int] NULL,
	[TransHeaderClassTypeID] [int] NULL,
	[TransDetailID] [int] NULL,
	[TransDetailClassTypeID] [int] NULL,
	[TaxAccountID] [int] NULL,
	[TaxClassID] [int] NULL,
	[TaxAmount] [float] NULL,
	[AvaTaxCode] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [TransTax_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_TransTax_siTransTax_TaxClass]    Script Date: 5/15/2018 12:07:01 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransTax_siTransTax_TaxClass] ON [dbo].[TransTax]
(
	[TaxClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransTax_siTransTax_TransDetail]    Script Date: 5/15/2018 12:07:01 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransTax_siTransTax_TransDetail] ON [dbo].[TransTax]
(
	[TransHeaderID] ASC,
	[TransHeaderClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransTax_siTransTax_TransHeader]    Script Date: 5/15/2018 12:07:01 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransTax_siTransTax_TransHeader] ON [dbo].[TransTax]
(
	[TransDetailID] ASC,
	[TransDetailClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
