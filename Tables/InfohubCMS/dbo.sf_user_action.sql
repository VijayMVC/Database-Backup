/****** Object:  Table [dbo].[sf_user_action]    Script Date: 5/15/2018 12:02:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_user_action](
	[user_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[exipration_date] [datetime] NOT NULL,
	[data_item_id] [uniqueidentifier] NULL,
	[dta] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[context] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[action_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_user_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
