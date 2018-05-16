/****** Object:  Table [dbo].[MSSQLogNonClickedTemp]    Script Date: 5/15/2018 12:05:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogNonClickedTemp](
	[clickId] [bigint] NOT NULL,
	[rank] [int] NOT NULL,
	[nonClickedUrl] [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[nonClickedUrlHash] [int] NULL,
	[nonClickedUrlId] [int] NULL
) ON [PRIMARY]

GO
