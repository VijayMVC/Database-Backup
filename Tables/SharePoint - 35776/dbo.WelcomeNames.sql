/****** Object:  Table [dbo].[WelcomeNames]    Script Date: 5/15/2018 12:05:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[WelcomeNames](
	[LeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Rank] [int] NOT NULL,
 CONSTRAINT [WelcomeNames_PK] PRIMARY KEY CLUSTERED 
(
	[LeafName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
