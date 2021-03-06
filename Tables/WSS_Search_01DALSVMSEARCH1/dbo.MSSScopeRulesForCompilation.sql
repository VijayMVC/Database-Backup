/****** Object:  Table [dbo].[MSSScopeRulesForCompilation]    Script Date: 5/15/2018 12:09:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSScopeRulesForCompilation](
	[ScopeID] [int] NOT NULL,
	[FilterBehavior] [smallint] NOT NULL,
	[RuleType] [smallint] NOT NULL,
	[UrlRuleType] [smallint] NOT NULL,
	[PropertyID] [int] NULL,
	[UserValueString] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]

GO
