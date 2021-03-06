/****** Object:  Table [GL].[InstallTextDim]    Script Date: 5/15/2018 11:59:33 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [GL].[InstallTextDim](
	[InstallTextKey] [int] IDENTITY(1,1) NOT NULL,
	[InstallTextName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_InstallTextKey] PRIMARY KEY CLUSTERED 
(
	[InstallTextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [GL].[InstallTextDim] ADD  CONSTRAINT [DF_InstallText_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
