/****** Object:  Table [dbo].[sf_ntf_msg_jb_cstm_mssg_haders]    Script Date: 5/15/2018 12:01:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ntf_msg_jb_cstm_mssg_haders](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_ntf_msg_jb_cstm_BA0FDFEC] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_ntf_msg_jb_cstm_mssg_hd]    Script Date: 5/15/2018 12:01:52 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ntf_msg_jb_cstm_mssg_hd] ON [dbo].[sf_ntf_msg_jb_cstm_mssg_haders]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_ntf_msg_jb_cstm_mssg_haders]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntf_msg_jb_cst_FF3D3E2C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_notif_msg_job] ([id])
ALTER TABLE [dbo].[sf_ntf_msg_jb_cstm_mssg_haders] CHECK CONSTRAINT [ref_sf_ntf_msg_jb_cst_FF3D3E2C]
GO
