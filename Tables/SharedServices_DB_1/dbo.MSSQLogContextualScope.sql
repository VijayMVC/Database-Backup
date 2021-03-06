/****** Object:  Table [dbo].[MSSQLogContextualScope]    Script Date: 5/15/2018 12:05:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogContextualScope](
	[contextualScopeId] [int] IDENTITY(1,1) NOT NULL,
	[contextualScopeNameId] [int] NULL,
	[contextualScopeUrlId] [int] NULL,
	[lastReference] [smalldatetime] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogContextualScope]    Script Date: 5/15/2018 12:05:15 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogContextualScope] ON [dbo].[MSSQLogContextualScope]
(
	[contextualScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
