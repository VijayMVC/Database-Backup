/****** Object:  Table [dbo].[Contracts]    Script Date: 5/15/2018 11:59:08 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Contracts](
	[___c_ID] [float] NULL,
	[___d_account_ID] [float] NULL,
	[___d_META_Contract] [float] NULL,
	[E_description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[E_status_action] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[E_status_description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[E_status_test] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort] [float] NULL,
	[valid_from] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[valid_to] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
