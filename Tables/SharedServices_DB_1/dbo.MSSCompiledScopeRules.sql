/****** Object:  Table [dbo].[MSSCompiledScopeRules]    Script Date: 5/15/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCompiledScopeRules](
	[ScopeID] [int] NOT NULL,
	[FilterBehavior] [smallint] NOT NULL,
	[RuleType] [smallint] NOT NULL,
	[UrlRuleType] [smallint] NOT NULL,
	[PropertyID] [int] NULL,
	[UserValueString] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]

GO
