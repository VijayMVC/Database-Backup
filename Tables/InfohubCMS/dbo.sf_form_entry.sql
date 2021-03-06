/****** Object:  Table [dbo].[sf_form_entry]    Script Date: 5/15/2018 12:01:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_form_entry](
	[visible] [tinyint] NOT NULL,
	[user_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_id] [uniqueidentifier] NULL,
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[submitted_on] [datetime] NULL,
	[status] [int] NOT NULL,
	[started_on] [datetime] NOT NULL,
	[source_site_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[source_site_id] [uniqueidentifier] NULL,
	[source_key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[referral_code] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[publication_date] [datetime] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[lnguage] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ip_address] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[description_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_created] [datetime] NOT NULL,
	[voa_class] [int] NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_form_entry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [sf_idx_ApplicationName]    Script Date: 5/15/2018 12:01:40 PM ******/
CREATE NONCLUSTERED INDEX [sf_idx_ApplicationName] ON [dbo].[sf_form_entry]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
