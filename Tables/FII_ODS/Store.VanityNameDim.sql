/****** Object:  Table [Store].[VanityNameDim]    Script Date: 5/15/2018 11:59:46 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Store].[VanityNameDim](
	[VanityNameKey] [int] IDENTITY(1,1) NOT NULL,
	[VanityNameName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_VanityNameKey] PRIMARY KEY CLUSTERED 
(
	[VanityNameKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Store].[VanityNameDim] ADD  CONSTRAINT [DF_VanityName_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
