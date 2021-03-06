/****** Object:  Table [Product].[MaterialTypeNameDim]    Script Date: 5/15/2018 11:59:40 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Product].[MaterialTypeNameDim](
	[MaterialTypeNameKey] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypeNameName] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_MaterialTypeNameKey] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeNameKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Product].[MaterialTypeNameDim] ADD  CONSTRAINT [DF_MaterialTypeName_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
