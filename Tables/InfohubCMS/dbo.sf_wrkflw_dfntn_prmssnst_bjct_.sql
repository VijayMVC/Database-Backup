/****** Object:  Table [dbo].[sf_wrkflw_dfntn_prmssnst_bjct_]    Script Date: 5/15/2018 12:02:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_wrkflw_dfntn_prmssnst_bjct_](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_wrkflw_dfntn_pr_BAA68923] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_wrkflw_dfntn_prmssnst_b]    Script Date: 5/15/2018 12:02:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wrkflw_dfntn_prmssnst_b] ON [dbo].[sf_wrkflw_dfntn_prmssnst_bjct_]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_wrkflw_dfntn_prmssnst_bjct_]  WITH CHECK ADD  CONSTRAINT [ref_sf_wrkflw_dfntn_p_C1FA88E1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_workflow_definition] ([id])
ALTER TABLE [dbo].[sf_wrkflw_dfntn_prmssnst_bjct_] CHECK CONSTRAINT [ref_sf_wrkflw_dfntn_p_C1FA88E1]
GO
