/****** Object:  Table [dbo].[sf_addresses]    Script Date: 5/15/2018 12:01:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_addresses](
	[zip] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[street] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[state_code] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[map_zoom_level] [int] NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[country_code] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
