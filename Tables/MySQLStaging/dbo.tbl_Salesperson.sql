/****** Object:  Table [dbo].[tbl_Salesperson]    Script Date: 5/15/2018 12:04:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tbl_Salesperson](
	[job_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[users_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[first_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [smallint] NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_tbl_SalesPerson_franchise_id]    Script Date: 5/15/2018 12:04:31 PM ******/
CREATE CLUSTERED INDEX [idx_tbl_SalesPerson_franchise_id] ON [dbo].[tbl_Salesperson]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_tbl_Salesperson_job_id_includes]    Script Date: 5/15/2018 12:04:31 PM ******/
CREATE NONCLUSTERED INDEX [idx_tbl_Salesperson_job_id_includes] ON [dbo].[tbl_Salesperson]
(
	[job_id] ASC
)
INCLUDE ( 	[users_id],
	[first_name],
	[last_name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_tbl_Salesperson_users_id_includes]    Script Date: 5/15/2018 12:04:31 PM ******/
CREATE NONCLUSTERED INDEX [idx_tbl_Salesperson_users_id_includes] ON [dbo].[tbl_Salesperson]
(
	[users_id] ASC
)
INCLUDE ( 	[job_id],
	[first_name],
	[last_name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
