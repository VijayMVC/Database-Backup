/****** Object:  Table [argot].[fs_report]    Script Date: 5/15/2018 11:59:07 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [argot].[fs_report](
	[fs_report_id] [int] IDENTITY(1,1) NOT NULL,
	[fs_report_description] [varchar](140) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fs_report_path] [varchar](140) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_fs_report] PRIMARY KEY CLUSTERED 
(
	[fs_report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
