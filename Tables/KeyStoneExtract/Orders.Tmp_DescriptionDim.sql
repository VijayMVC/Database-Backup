/****** Object:  Table [Orders].[Tmp_DescriptionDim]    Script Date: 5/15/2018 12:02:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[Tmp_DescriptionDim](
	[DescriptionKey] [int] IDENTITY(1,1) NOT NULL,
	[DescriptionName] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL
) ON [PRIMARY]

GO
