/****** Object:  Table [dbo].[vw_rpt_BillingContacts]    Script Date: 5/15/2018 11:59:28 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[vw_rpt_BillingContacts](
	[CustomerID] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContactID] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[primary_flag] [smallint] NULL
) ON [PRIMARY]

GO
