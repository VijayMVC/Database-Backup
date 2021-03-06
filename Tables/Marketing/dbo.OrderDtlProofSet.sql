/****** Object:  Table [dbo].[OrderDtlProofSet]    Script Date: 5/15/2018 12:02:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderDtlProofSet](
	[PrfSId] [int] NOT NULL,
	[OrdHId] [int] NOT NULL,
	[OrdPSId] [int] NOT NULL,
	[OrdPSName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSHandOutOption] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSFoldingOption] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSFoldingFee] [float] NULL,
	[OrdPSFoldingQty] [int] NULL,
	[OrdPSImprintFee] [float] NULL,
	[OrdPSImprintQty] [int] NULL,
	[OrdPSImageName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSPDFName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdPSApprovedDate] [datetime] NULL,
	[OrdPSChangeRequest] [bit] NULL,
 CONSTRAINT [PK_OrderDtlPrrofSet] PRIMARY KEY CLUSTERED 
(
	[OrdPSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
