/****** Object:  Table [dbo].[Phones]    Script Date: 5/15/2018 12:06:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Phones](
	[MODID] [tinyint] NULL,
	[RECORDID] [bigint] NULL,
	[___c_ID] [bigint] NULL,
	[___d_account] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_contact] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_municipality] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___d_vendor] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[___type_ID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__creation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__DG_trigger] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__modification] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__modified_last] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_type_display] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[data] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone_extension] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
