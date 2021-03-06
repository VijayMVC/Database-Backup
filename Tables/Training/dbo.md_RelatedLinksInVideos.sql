/****** Object:  Table [dbo].[md_RelatedLinksInVideos]    Script Date: 5/15/2018 12:07:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[md_RelatedLinksInVideos](
	[VideoID] [int] NOT NULL,
	[LinkID] [int] NOT NULL,
 CONSTRAINT [PK_md_RelatedLinksInVideos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC,
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
