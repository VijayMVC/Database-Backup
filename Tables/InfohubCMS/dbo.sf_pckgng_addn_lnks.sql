/****** Object:  Table [dbo].[sf_pckgng_addn_lnks]    Script Date: 5/15/2018 12:01:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pckgng_addn_lnks](
	[itm_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[itm_prvdr] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[itm_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[addn_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pckgng_addn_lnks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_addn_id_itm_tpe]    Script Date: 5/15/2018 12:01:56 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_addn_id_itm_tpe] ON [dbo].[sf_pckgng_addn_lnks]
(
	[addn_id] ASC,
	[itm_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
