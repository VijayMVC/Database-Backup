/****** Object:  Table [dbo].[CrossSellProduct]    Script Date: 5/15/2018 12:03:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CrossSellProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId1] [int] NOT NULL,
	[ProductId2] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
