/****** Object:  Table [dbo].[RoyaltyReports]    Script Date: 5/15/2018 11:59:04 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RoyaltyReports](
	[RoyaltyPeriod] [date] NOT NULL,
	[CompanyLocationId] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CompanyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocationId] [bigint] NULL,
	[RoyaltyGroupId] [int] NOT NULL,
	[RoyaltyGroupName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PlanID] [int] NOT NULL,
	[PlanName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLAcctId] [bigint] NOT NULL,
	[GL_Account] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoyaltyPercent] [real] NULL,
	[Amount] [money] NULL,
	[RoyaltyAmount] [money] NULL,
	[Currency] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_RoyaltyReports] PRIMARY KEY CLUSTERED 
(
	[RoyaltyPeriod] ASC,
	[CompanyLocationId] ASC,
	[RoyaltyGroupId] ASC,
	[PlanID] ASC,
	[GLAcctId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
