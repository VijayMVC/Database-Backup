/****** Object:  Table [dbo].[sf_counters]    Script Date: 5/15/2018 12:01:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_counters](
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_value] [bigint] NOT NULL,
 CONSTRAINT [pk_sf_counters] PRIMARY KEY CLUSTERED 
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
