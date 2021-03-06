/****** Object:  Table [dbo].[WebTrafficStaging2]    Script Date: 5/15/2018 12:02:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[WebTrafficStaging2](
	[Webnumber] [int] NOT NULL,
	[Month] [datetime] NOT NULL,
	[ReferringSite] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Visits] [int] NOT NULL,
 CONSTRAINT [PK_WebTrafficStaging2] PRIMARY KEY CLUSTERED 
(
	[Webnumber] ASC,
	[Month] ASC,
	[ReferringSite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_WebTrafficStaging2]    Script Date: 5/15/2018 12:02:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_WebTrafficStaging2] ON [dbo].[WebTrafficStaging2]
(
	[Webnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
