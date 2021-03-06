/****** Object:  Table [GL].[ModifierTextDim]    Script Date: 5/15/2018 11:59:34 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [GL].[ModifierTextDim](
	[ModifierTextKey] [int] IDENTITY(1,1) NOT NULL,
	[ModifierTextName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_ModifierTextKey] PRIMARY KEY CLUSTERED 
(
	[ModifierTextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [GL].[ModifierTextDim] ADD  CONSTRAINT [DF_ModifierText_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
