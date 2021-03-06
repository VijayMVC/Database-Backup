/****** Object:  Table [dbo].[sf_lst_sf_subscriber]    Script Date: 5/15/2018 12:01:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_lst_sf_subscriber](
	[id2] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_lst_sf_subscriber] PRIMARY KEY CLUSTERED 
(
	[id2] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_lst_sf_subscriber_id]    Script Date: 5/15/2018 12:01:45 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lst_sf_subscriber_id] ON [dbo].[sf_lst_sf_subscriber]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_lst_sf_subscriber]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_sf_sbscrbr_63418318] FOREIGN KEY([id])
REFERENCES [dbo].[sf_lst] ([id])
ALTER TABLE [dbo].[sf_lst_sf_subscriber] CHECK CONSTRAINT [ref_sf_lst_sf_sbscrbr_63418318]
ALTER TABLE [dbo].[sf_lst_sf_subscriber]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_sf_sbscrbr_791CF52E] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_subscriber] ([id])
ALTER TABLE [dbo].[sf_lst_sf_subscriber] CHECK CONSTRAINT [ref_sf_lst_sf_sbscrbr_791CF52E]
GO
