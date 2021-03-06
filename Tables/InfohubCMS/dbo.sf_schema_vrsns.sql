/****** Object:  Table [dbo].[sf_schema_vrsns]    Script Date: 5/15/2018 12:02:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_schema_vrsns](
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[module_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[connection_id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[connection_hash] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[assembly] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cultures] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[version_number] [int] NOT NULL,
	[previous_version_number] [int] NOT NULL,
	[meta_data_changed] [tinyint] NOT NULL,
	[last_upgrade_date] [datetime] NOT NULL,
 CONSTRAINT [pk_sf_schema_vrsns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_schema_vrsns]    Script Date: 5/15/2018 12:02:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_schema_vrsns] ON [dbo].[sf_schema_vrsns]
(
	[app_name] ASC,
	[module_name] ASC,
	[connection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
