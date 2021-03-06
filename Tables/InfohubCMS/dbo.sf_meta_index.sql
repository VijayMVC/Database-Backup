/****** Object:  Table [dbo].[sf_meta_index]    Script Date: 5/15/2018 12:01:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_meta_index](
	[id] [uniqueidentifier] NOT NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[unque] [tinyint] NOT NULL,
	[clstered] [tinyint] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_index] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
