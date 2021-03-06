/****** Object:  Table [dbo].[sf_ntf_sbscrbrs_cstm_prperties]    Script Date: 5/15/2018 12:01:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ntf_sbscrbrs_cstm_prperties](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_ntf_sbscrbrs_cs_1708B61C] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_ntf_sbscrbrs_cstm_prprt]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ntf_sbscrbrs_cstm_prprt] ON [dbo].[sf_ntf_sbscrbrs_cstm_prperties]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_ntf_sbscrbrs_cstm_prperties]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntf_sbscrbrs_c_66278547] FOREIGN KEY([id])
REFERENCES [dbo].[sf_notif_subscribers] ([id])
ALTER TABLE [dbo].[sf_ntf_sbscrbrs_cstm_prperties] CHECK CONSTRAINT [ref_sf_ntf_sbscrbrs_c_66278547]
GO
