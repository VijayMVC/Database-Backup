/****** Object:  Table [dbo].[SLS_ROYALTY_PERIOD_backup]    Script Date: 5/15/2018 11:58:40 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SLS_ROYALTY_PERIOD_backup](
	[RoyaltyPeriodID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[FiscalYear] [int] NULL
) ON [PRIMARY]

GO
