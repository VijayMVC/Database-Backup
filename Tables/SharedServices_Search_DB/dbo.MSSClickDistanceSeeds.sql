/****** Object:  Table [dbo].[MSSClickDistanceSeeds]    Script Date: 5/15/2018 12:05:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSClickDistanceSeeds](
	[DisplayURL] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DisplayHash] [int] NOT NULL,
	[AuthorityLevel] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSClickDistanceSeeds]    Script Date: 5/15/2018 12:05:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSClickDistanceSeeds] ON [dbo].[MSSClickDistanceSeeds]
(
	[DisplayHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
