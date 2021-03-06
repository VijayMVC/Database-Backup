/****** Object:  Table [dbo].[CategoryCatalog]    Script Date: 5/15/2018 12:02:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CategoryCatalog](
	[CatlId] [int] NOT NULL,
	[CatId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryCatalog] PRIMARY KEY CLUSTERED 
(
	[CatlId] ASC,
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
