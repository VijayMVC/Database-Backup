/****** Object:  Table [dbo].[sf_version_trunks]    Script Date: 5/15/2018 12:02:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_version_trunks](
	[nme] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_version_trunks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [sf_idx_vrsn_trnks_app_nme]    Script Date: 5/15/2018 12:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sf_idx_vrsn_trnks_app_nme] ON [dbo].[sf_version_trunks]
(
	[app_name] ASC,
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
