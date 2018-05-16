/****** Object:  Table [dbo].[HT_Settings]    Script Date: 5/15/2018 12:05:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[HT_Settings](
	[key] [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[value] [bigint] NULL,
 CONSTRAINT [HT_Setting_PK] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
