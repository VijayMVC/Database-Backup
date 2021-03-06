/****** Object:  Table [GL].[DescriptionDim]    Script Date: 5/15/2018 11:59:33 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [GL].[DescriptionDim](
	[DescriptionKey] [int] IDENTITY(1,1) NOT NULL,
	[DescriptionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_DescriptionKey] PRIMARY KEY CLUSTERED 
(
	[DescriptionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [DescriptionDim_DescriptionName]    Script Date: 5/15/2018 11:59:33 AM ******/
CREATE NONCLUSTERED INDEX [DescriptionDim_DescriptionName] ON [GL].[DescriptionDim]
(
	[DescriptionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [GL].[DescriptionDim] ADD  CONSTRAINT [DF_Description_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
