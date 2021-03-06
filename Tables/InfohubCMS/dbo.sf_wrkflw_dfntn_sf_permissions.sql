/****** Object:  Table [dbo].[sf_wrkflw_dfntn_sf_permissions]    Script Date: 5/15/2018 12:02:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_wrkflw_dfntn_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_wrkflw_dfntn_sf_68418B3E] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_wrkflw_dfntn_sf_prmssns]    Script Date: 5/15/2018 12:02:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wrkflw_dfntn_sf_prmssns] ON [dbo].[sf_wrkflw_dfntn_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_wrkflw_dfntn_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_wrkflw_dfntn_s_3932810D] FOREIGN KEY([id])
REFERENCES [dbo].[sf_workflow_definition] ([id])
ALTER TABLE [dbo].[sf_wrkflw_dfntn_sf_permissions] CHECK CONSTRAINT [ref_sf_wrkflw_dfntn_s_3932810D]
ALTER TABLE [dbo].[sf_wrkflw_dfntn_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_wrkflw_dfntn_s_9E8530D8] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
ALTER TABLE [dbo].[sf_wrkflw_dfntn_sf_permissions] CHECK CONSTRAINT [ref_sf_wrkflw_dfntn_s_9E8530D8]
GO
