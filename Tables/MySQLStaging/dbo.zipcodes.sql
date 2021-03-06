/****** Object:  Table [dbo].[zipcodes]    Script Date: 5/15/2018 12:04:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[zipcodes](
	[zipcode] [int] IDENTITY(91610,1) NOT NULL,
	[city] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[state_id] [int] NOT NULL,
	[lat] [decimal](10, 6) NOT NULL,
	[lon] [decimal](10, 6) NOT NULL,
 CONSTRAINT [PK_zipcodes_zipcode] PRIMARY KEY CLUSTERED 
(
	[zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [state_id]    Script Date: 5/15/2018 12:04:34 PM ******/
CREATE NONCLUSTERED INDEX [state_id] ON [dbo].[zipcodes]
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[zipcodes] ADD  DEFAULT (N'') FOR [city]
ALTER TABLE [dbo].[zipcodes] ADD  DEFAULT ((0.000000)) FOR [lat]
ALTER TABLE [dbo].[zipcodes] ADD  DEFAULT ((0.000000)) FOR [lon]
GO
