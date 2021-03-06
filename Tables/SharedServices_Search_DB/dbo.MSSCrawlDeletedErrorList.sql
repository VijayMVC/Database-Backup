/****** Object:  Table [dbo].[MSSCrawlDeletedErrorList]    Script Date: 5/15/2018 12:05:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCrawlDeletedErrorList](
	[DeletedID] [int] NOT NULL,
	[ErrorMsg] [nvarchar](2000) COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [PK_MSSCrawlDeletedErrorList] PRIMARY KEY CLUSTERED 
(
	[DeletedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
