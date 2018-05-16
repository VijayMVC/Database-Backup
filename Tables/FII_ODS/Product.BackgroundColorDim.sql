/****** Object:  Table [Product].[BackgroundColorDim]    Script Date: 5/15/2018 11:59:39 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Product].[BackgroundColorDim](
	[BackgroundColorKey] [int] IDENTITY(1,1) NOT NULL,
	[BackgroundColorName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_BackgroundColorKey] PRIMARY KEY CLUSTERED 
(
	[BackgroundColorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Product].[BackgroundColorDim] ADD  CONSTRAINT [DF_BackgroundColor_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
