/****** Object:  Table [dbo].[CustomTemplates]    Script Date: 5/15/2018 12:06:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CustomTemplates](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LCID] [int] NOT NULL,
	[Content] [image] NOT NULL,
	[TemplateId] [int] NULL,
 CONSTRAINT [CustomTemplates_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
