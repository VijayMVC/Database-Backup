/****** Object:  Table [dbo].[sf_workflow_scope_selected_ids]    Script Date: 5/15/2018 12:02:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_workflow_scope_selected_ids](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_wrkflw_scp_slct_429D78D1] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_wrkflw_scp_slctd_ds_val]    Script Date: 5/15/2018 12:02:09 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wrkflw_scp_slctd_ds_val] ON [dbo].[sf_workflow_scope_selected_ids]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_workflow_scope_selected_ids]  WITH CHECK ADD  CONSTRAINT [ref_sf_wrkflw_scp_slc_64A1ED6C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_workflow_scope] ([id])
ALTER TABLE [dbo].[sf_workflow_scope_selected_ids] CHECK CONSTRAINT [ref_sf_wrkflw_scp_slc_64A1ED6C]
GO
