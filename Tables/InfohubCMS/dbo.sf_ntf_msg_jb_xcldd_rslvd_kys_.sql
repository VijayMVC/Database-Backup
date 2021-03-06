/****** Object:  Table [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_]    Script Date: 5/15/2018 12:01:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_ntf_msg_jb_xcld_6290C7BE] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_ntf_msg_jb_xcldd_rslvd_]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ntf_msg_jb_xcldd_rslvd_] ON [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntf_msg_jb_xcl_3D6E6593] FOREIGN KEY([id])
REFERENCES [dbo].[sf_notif_msg_job] ([id])
ALTER TABLE [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_] CHECK CONSTRAINT [ref_sf_ntf_msg_jb_xcl_3D6E6593]
GO
