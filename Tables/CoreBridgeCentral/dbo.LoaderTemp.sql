/****** Object:  Table [dbo].[LoaderTemp]    Script Date: 5/15/2018 11:59:03 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[LoaderTemp](
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FranchiseName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocationId] [int] NULL,
	[InvoiceNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderCompletionDate] [datetime] NULL,
	[OrderClosedDate] [datetime] NULL,
	[OrderStatusId1] [int] NULL,
	[OrderClosedDate1] [datetime] NULL
) ON [PRIMARY]

GO
