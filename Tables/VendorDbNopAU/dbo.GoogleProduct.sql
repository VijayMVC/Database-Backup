/****** Object:  Table [dbo].[GoogleProduct]    Script Date: 5/15/2018 12:07:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GoogleProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Taxonomy] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AgeGroup] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Size] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Material] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pattern] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemGroupId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomGoods] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
