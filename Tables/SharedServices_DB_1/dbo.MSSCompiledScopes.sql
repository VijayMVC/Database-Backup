/****** Object:  Table [dbo].[MSSCompiledScopes]    Script Date: 5/15/2018 12:05:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCompiledScopes](
	[ScopeID] [int] NOT NULL,
	[ConsumerID] [int] NOT NULL,
	[Name] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[CompilationState] [smallint] NOT NULL
) ON [PRIMARY]

GO
