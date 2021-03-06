/****** Object:  Table [dbo].[Material]    Script Date: 5/15/2018 12:02:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Material](
	[MatId] [int] NOT NULL,
	[MatName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatVendorId] [int] NOT NULL,
	[MatVendorSku] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MatStatus] [smallint] NULL,
	[MatDisabled] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatHidden] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatAvailFrom] [smalldatetime] NULL,
	[MatAvailThru] [smalldatetime] NULL,
	[MatRePrintable] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatReOrderSignUpDate] [smalldatetime] NULL,
	[MatMinOrderQty] [int] NULL,
	[MatOrderInc] [int] NULL,
	[MatMinQtyLevel] [int] NULL,
	[MatMaxQtyLevel] [int] NULL,
	[MatDeadlineDays] [smallint] NULL,
	[MatImageFile] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatProofImageFile] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatProofImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatPresentationStyle] [smallint] NULL,
	[MatMinReOrderQty] [int] NULL,
	[MatTotVQOH] [int] NULL,
	[MatTotVQtyAllocated] [int] NULL,
	[MatTotSMatQtyAllocated] [int] NULL,
	[MatTotSMailQtyAllocated] [int] NULL,
	[MatTotQtyOnOrder] [int] NULL,
	[MatAvailFromDate] [smalldatetime] NULL,
	[MatAvailThruDate] [smalldatetime] NULL,
	[MatQtyAvailEstShipDays] [smallint] NULL,
	[MatQtyNotAvailEstShipDays] [smallint] NULL,
	[MatQtyNotOrdEstShipDays] [smallint] NULL,
	[MatImprintShipDays] [smallint] NULL,
	[MatProofSetId] [int] NULL,
	[MatFolding] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatAvailMailOnDemand] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatFirstClassPostageFee] [float] NULL,
	[MatStndPostageFee] [float] NULL,
	[MatAddBRM] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatImprintable] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[MatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_Material]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Material] ON [dbo].[Material]
(
	[MatVendorId] ASC,
	[MatVendorSku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
