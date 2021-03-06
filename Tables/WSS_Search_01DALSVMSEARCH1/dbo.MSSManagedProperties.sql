/****** Object:  Table [dbo].[MSSManagedProperties]    Script Date: 5/15/2018 12:09:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSManagedProperties](
	[PID] [int] NOT NULL,
	[FriendlyName] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PropertyDescription] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ManagedType] [int] NULL,
	[FullTextQueriable] [bit] NOT NULL,
	[Retrievable] [bit] NOT NULL,
	[Scoped] [bit] NOT NULL,
	[RespectPriority] [bit] NOT NULL,
	[RemoveDuplicates] [bit] NOT NULL,
	[NoDelete] [bit] NOT NULL,
	[NoMap] [bit] NOT NULL,
	[Hidden] [bit] NOT NULL,
	[HasMultipleValues] [bit] NOT NULL,
	[NoWordBreaker] [bit] NOT NULL,
	[NameNormalized] [bit] NOT NULL,
	[IncludeInMD5] [bit] NOT NULL,
	[openbit1] [bit] NULL,
	[openbit2] [bit] NULL,
	[Mapped] [bit] NOT NULL,
	[QueryIndependentRank] [bit] NOT NULL,
	[userFlags] [smallint] NOT NULL,
	[WordBreakerOverride] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[LengthNormalization] [float] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_MSSManagedProperties] PRIMARY KEY CLUSTERED 
(
	[FriendlyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_MSSManagedProperties]    Script Date: 5/15/2018 12:09:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MSSManagedProperties] ON [dbo].[MSSManagedProperties]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [Scoped]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [RespectPriority]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((1)) FOR [RemoveDuplicates]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [NoDelete]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [NoMap]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [Hidden]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [HasMultipleValues]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [NoWordBreaker]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [NameNormalized]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [IncludeInMD5]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [Mapped]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [QueryIndependentRank]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [userFlags]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [WordBreakerOverride]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [Weight]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ((0)) FOR [LengthNormalization]
ALTER TABLE [dbo].[MSSManagedProperties] ADD  DEFAULT ('2000-01-01 01:01:01.000') FOR [LastModified]
GO
