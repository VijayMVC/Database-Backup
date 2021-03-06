/****** Object:  Table [system].[keystone_report_links]    Script Date: 5/15/2018 12:04:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [system].[keystone_report_links](
	[user_role_id] [int] NOT NULL,
	[user_role] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[report_title] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[report_path] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[report_desc] [varchar](1023) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[center_no] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[report_type] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_keystone_report_links] PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
