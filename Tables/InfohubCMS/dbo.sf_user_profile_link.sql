/****** Object:  Table [dbo].[sf_user_profile_link]    Script Date: 5/15/2018 12:02:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_user_profile_link](
	[user_profile_type_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_id] [uniqueidentifier] NULL,
	[profile_id] [uniqueidentifier] NULL,
	[membership] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_user_profile_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_profile_link_user_id]    Script Date: 5/15/2018 12:02:08 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_profile_link_user_id] ON [dbo].[sf_user_profile_link]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [UC_profile]    Script Date: 5/15/2018 12:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UC_profile] ON [dbo].[sf_user_profile_link]
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
