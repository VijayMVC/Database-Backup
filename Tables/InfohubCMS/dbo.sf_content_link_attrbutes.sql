/****** Object:  Table [dbo].[sf_content_link_attrbutes]    Script Date: 5/15/2018 12:01:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_content_link_attrbutes](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[val] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_content_link_attrbutes] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sf_content_link_attrbutes]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_lnk_ttrb_E946E39C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_content_link] ([id])
ALTER TABLE [dbo].[sf_content_link_attrbutes] CHECK CONSTRAINT [ref_sf_cntnt_lnk_ttrb_E946E39C]
GO
