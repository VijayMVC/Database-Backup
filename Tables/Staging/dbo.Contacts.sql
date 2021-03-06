/****** Object:  Table [dbo].[Contacts]    Script Date: 5/15/2018 12:06:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Contacts](
	[MODID] [tinyint] NULL,
	[RECORDID] [int] NULL,
	[___c_ID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_account] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_job_location] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_phone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_phone_pri] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_vendor] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_hilite_sort] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_name_full] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[company] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[edit_mode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fax] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[international] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name_first] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name_last] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[primary] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[role] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
