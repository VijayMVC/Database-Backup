/****** Object:  Table [dbo].[MSSScopesForCompilation]    Script Date: 5/15/2018 12:09:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSScopesForCompilation](
	[ScopeID] [int] NOT NULL,
	[ConsumerID] [int] NOT NULL,
	[Name] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[CompilationState] [smallint] NOT NULL
) ON [PRIMARY]

GO
