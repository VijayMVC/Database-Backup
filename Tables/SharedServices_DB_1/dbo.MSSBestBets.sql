/****** Object:  Table [dbo].[MSSBestBets]    Script Date: 5/15/2018 12:05:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSBestBets](
	[BestBetID] [int] NOT NULL,
	[Title] [nvarchar](100) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Url] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Description] [nvarchar](500) COLLATE Latin1_General_CI_AS_KS_WS NULL,
PRIMARY KEY CLUSTERED 
(
	[BestBetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
