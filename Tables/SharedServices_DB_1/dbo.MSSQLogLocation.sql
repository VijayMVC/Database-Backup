/****** Object:  Table [dbo].[MSSQLogLocation]    Script Date: 5/15/2018 12:05:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogLocation](
	[locationId] [int] IDENTITY(1,1) NOT NULL,
	[location] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[lastReference] [datetime] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogLocation]    Script Date: 5/15/2018 12:05:16 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogLocation] ON [dbo].[MSSQLogLocation]
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_MSSQLogLocation]    Script Date: 5/15/2018 12:05:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSQLogLocation] ON [dbo].[MSSQLogLocation]
(
	[location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
