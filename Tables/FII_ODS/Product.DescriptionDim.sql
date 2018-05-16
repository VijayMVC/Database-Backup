/****** Object:  Table [Product].[DescriptionDim]    Script Date: 5/15/2018 11:59:40 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Product].[DescriptionDim](
	[DescriptionKey] [int] IDENTITY(1,1) NOT NULL,
	[DescriptionName] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_DescriptionKey] PRIMARY KEY CLUSTERED 
(
	[DescriptionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [Product].[DescriptionDim] ADD  CONSTRAINT [DF_Description_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
