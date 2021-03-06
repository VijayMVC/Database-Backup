/****** Object:  Table [dbo].[tblFAQ]    Script Date: 5/15/2018 12:01:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tblFAQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[vcQuestion] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[vcLink] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[vcLinkText] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblFAQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
