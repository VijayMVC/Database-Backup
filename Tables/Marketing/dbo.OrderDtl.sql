/****** Object:  Table [dbo].[OrderDtl]    Script Date: 5/15/2018 12:02:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderDtl](
	[OrdHId] [int] NOT NULL,
	[OrdDId] [int] NOT NULL,
	[OrdDPrdId] [int] NOT NULL,
	[OrdDPrdCatType] [tinyint] NOT NULL,
	[OrdDPrdGId] [int] NULL,
	[OrdDPrdGDMailDate] [smalldatetime] NULL,
	[OrdDActShipDate] [smalldatetime] NULL,
	[OrdDSignUpDeadline] [smalldatetime] NULL,
	[OrdDShipTracking] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdDRMPHId] [int] NULL,
	[OrdDCatlId] [int] NULL,
	[OrdDtlCatId] [int] NULL,
	[OrdDQty] [int] NULL,
	[OrdDPrice] [float] NULL,
	[OrdDOnSale] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdDFoldingSelection] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdDImprintSelection] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdDHandOutSelection] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdDMailOnDemandPostageType] [tinyint] NULL,
	[OrdDMailOnDemandPostageFee] [float] NULL,
	[OrdDMailOnDemandPostageAmount] [float] NULL,
	[OrdDListPurchaseAmount] [float] NULL,
	[OrdDPSId] [int] NULL,
	[OrdDPSQtyApproved] [bit] NULL,
	[OrdDMPHId] [int] NULL,
	[OrdDAmount] [float] NULL,
	[OrdDVendorInvoice] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdDSubsidyReimbursementSent] [smalldatetime] NULL,
	[OrdDSubsidyReimbursementApproved] [smalldatetime] NULL,
 CONSTRAINT [PK_OrderDtl] PRIMARY KEY CLUSTERED 
(
	[OrdHId] ASC,
	[OrdDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
