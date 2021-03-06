/****** Object:  Table [dbo].[MSSChildContentSources]    Script Date: 5/15/2018 12:05:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSChildContentSources](
	[FarmName] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Name] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[StartAddress] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
UNIQUE CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
