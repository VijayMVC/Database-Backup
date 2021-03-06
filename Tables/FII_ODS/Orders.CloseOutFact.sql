/****** Object:  Table [Orders].[CloseOutFact]    Script Date: 5/15/2018 11:59:35 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[CloseOutFact](
	[ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CloseOutDate] [datetime] NOT NULL,
	[CloseOutType] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SalesTotal] [money] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SignSales] [money] NULL,
	[AVISales] [money] NULL,
	[InstallSales] [money] NULL,
	[ProductionCat1Sales] [money] NULL,
	[ProductionCat2Sales] [money] NULL,
	[ProductionCat3Sales] [money] NULL,
	[SalesSubtotal] [money] NULL,
	[TaxExemptAmount] [money] NULL,
	[CountySalesTax] [money] NULL,
	[StateSalesTax] [money] NULL,
	[TaxTotal] [money] NULL,
	[DiscountAmount] [money] NULL,
	[ShippingCharge] [money] NULL,
	[InterestAmount] [money] NULL,
	[WriteOffAmount] [money] NULL,
	[OrderPayments] [money] NULL,
	[OtherPayments] [money] NULL,
	[CloseOutPersonID] [int] NULL,
	[OLTP_Insertdate] [datetime] NULL,
	[OLTP_Updatedate] [datetime] NULL,
	[CenterKey] [int] NULL,
	[UpdateChecksum] [int] NULL,
 CONSTRAINT [PK_CloseOutFact] PRIMARY KEY CLUSTERED 
(
	[ZW_Franchise_ID] ASC,
	[CloseOutDate] ASC,
	[CloseOutType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
