/****** Object:  Table [dbo].[Job_Items]    Script Date: 5/15/2018 11:59:09 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Job_Items](
	[___c_ID] [float] NULL,
	[___d_item_parent] [float] NULL,
	[___d_job] [float] NULL,
	[___d_SKU] [float] NULL,
	[__creation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[__DG_trigger] [datetime] NULL,
	[__modification] [datetime] NULL,
	[__modified_last] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_action_rep_G] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_cache_trigger_entry] [float] NULL,
	[_cached_current_value] [float] NULL,
	[_cached_status_value] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[comment] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_install] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_sign] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SKU] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku_description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort] [float] NULL
) ON [PRIMARY]

GO
