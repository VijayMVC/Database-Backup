/****** Object:  Table [dbo].[sf_chunks]    Script Date: 5/15/2018 12:01:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_chunks](
	[sze] [int] NOT NULL,
	[ordinal] [int] NOT NULL,
	[file_id] [uniqueidentifier] NOT NULL,
	[dta] [image] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_chunks] PRIMARY KEY CLUSTERED 
(
	[file_id] ASC,
	[ordinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
