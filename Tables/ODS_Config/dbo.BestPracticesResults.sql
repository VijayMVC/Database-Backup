/****** Object:  Table [dbo].[BestPracticesResults]    Script Date: 5/15/2018 12:04:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BestPracticesResults](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EvaluationId] [uniqueidentifier] NOT NULL,
	[RuleId] [uniqueidentifier] NOT NULL,
	[EvaluatedDateTime] [datetime] NOT NULL,
	[ItemIdentifier] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemIdentifierAlias] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ObjectName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ObjectPath] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK__BestPrac__3214EC071AF6FA7B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_BestPracticesResults_EvaluationId_with_Included]    Script Date: 5/15/2018 12:04:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_BestPracticesResults_EvaluationId_with_Included] ON [dbo].[BestPracticesResults]
(
	[EvaluationId] ASC
)
INCLUDE ( 	[RuleId],
	[ItemIdentifier],
	[ItemIdentifierAlias],
	[ObjectName],
	[ObjectPath]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_BestPracticesResults_RuleId]    Script Date: 5/15/2018 12:04:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_BestPracticesResults_RuleId] ON [dbo].[BestPracticesResults]
(
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
