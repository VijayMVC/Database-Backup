/****** Object:  Table [dbo].[MSSScopeRules]    Script Date: 5/15/2018 12:05:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSScopeRules](
	[RuleID] [int] IDENTITY(0,1) NOT NULL,
	[ScopeID] [int] NOT NULL,
	[FilterBehavior] [smallint] NOT NULL,
	[RuleType] [smallint] NOT NULL,
	[UrlRuleType] [smallint] NOT NULL,
	[PropertyID] [int] NULL,
	[UserValueString] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[MSSScopeRules]  WITH CHECK ADD  CONSTRAINT [FK_ScopeRules_ScopeID] FOREIGN KEY([ScopeID])
REFERENCES [dbo].[MSSScopes] ([ScopeID])
ON DELETE CASCADE
ALTER TABLE [dbo].[MSSScopeRules] CHECK CONSTRAINT [FK_ScopeRules_ScopeID]
GO
