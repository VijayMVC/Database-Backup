/****** Object:  Table [dbo].[Job_Types]    Script Date: 5/15/2018 11:59:09 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Job_Types](
	[___c_ID] [float] NULL,
	[___d_account] [float] NULL,
	[___d_account_web] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_default_role] [float] NULL,
	[___d_META_Job_Type_ID] [float] NULL,
	[__DG_trigger] [datetime] NULL,
	[_web_visible] [float] NULL,
	[E_description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[E_value_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[E_value_test] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort] [float] NULL,
	[valid_from] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[valid_to] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_job_type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_sort] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_type_number] [float] NULL
) ON [PRIMARY]

GO
