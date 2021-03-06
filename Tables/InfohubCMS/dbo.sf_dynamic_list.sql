/****** Object:  Table [dbo].[sf_dynamic_list]    Script Date: 5/15/2018 12:01:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_dynamic_list](
	[sf_dynamic_list_id] [int] NOT NULL,
	[list_key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_name_mapped_field] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[first_name_mapped_field] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[email_mapped_field] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[dynamic_list_provider_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[connection_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[dynamic_list_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_dynamic_list] PRIMARY KEY CLUSTERED 
(
	[sf_dynamic_list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_dynmc_lst_dynmc_list_id]    Script Date: 5/15/2018 12:01:30 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dynmc_lst_dynmc_list_id] ON [dbo].[sf_dynamic_list]
(
	[dynamic_list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
