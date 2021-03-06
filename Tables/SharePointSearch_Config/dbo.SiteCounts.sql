/****** Object:  Table [dbo].[SiteCounts]    Script Date: 5/15/2018 12:06:08 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SiteCounts](
	[DatabaseId] [uniqueidentifier] NOT NULL,
	[NumSites] [int] NOT NULL,
 CONSTRAINT [PK_DatabaseId] PRIMARY KEY CLUSTERED 
(
	[DatabaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
