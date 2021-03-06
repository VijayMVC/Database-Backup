/****** Object:  Table [Orders].[ProductCodeDim]    Script Date: 5/15/2018 12:02:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[ProductCodeDim](
	[ProductCodeKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCodeName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCodeKey] PRIMARY KEY CLUSTERED 
(
	[ProductCodeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
