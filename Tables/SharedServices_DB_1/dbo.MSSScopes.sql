/****** Object:  Table [dbo].[MSSScopes]    Script Date: 5/15/2018 12:05:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSScopes](
	[ScopeID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description] [nvarchar](300) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ConsumerID] [int] NOT NULL,
	[DisplayInAdminUI] [bit] NOT NULL,
	[AlternateResultsPageUrl] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[CompilationType] [smallint] NOT NULL,
	[CompilationState] [smallint] NOT NULL,
	[LastCompilationTime] [datetime] NULL,
	[LastModifiedTime] [datetime] NOT NULL,
	[LastModifiedBy] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LastChangeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScopeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[ConsumerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[MSSScopes]  WITH CHECK ADD  CONSTRAINT [FK_Scopes_ConsumerID] FOREIGN KEY([ConsumerID])
REFERENCES [dbo].[MSSRegisteredConsumers] ([ConsumerID])
ON DELETE CASCADE
ALTER TABLE [dbo].[MSSScopes] CHECK CONSTRAINT [FK_Scopes_ConsumerID]
GO
