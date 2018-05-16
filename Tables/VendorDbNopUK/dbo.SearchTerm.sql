/****** Object:  Table [dbo].[SearchTerm]    Script Date: 5/15/2018 12:08:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SearchTerm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Keyword] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StoreId] [int] NOT NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
