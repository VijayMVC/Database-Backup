/****** Object:  Table [dbo].[ev_BillingStatus]    Script Date: 5/15/2018 12:07:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ev_BillingStatus](
	[BillingStatusID] [int] IDENTITY(1,1) NOT NULL,
	[BillingStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
