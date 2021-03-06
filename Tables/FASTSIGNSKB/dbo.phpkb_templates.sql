/****** Object:  Table [dbo].[phpkb_templates]    Script Date: 5/15/2018 11:59:19 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phpkb_templates](
	[template_id] [int] IDENTITY(1,1) NOT NULL,
	[author_id] [int] NOT NULL,
	[template_title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[template_content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[template_date_time] [smalldatetime] NOT NULL,
	[template_last_updation] [smalldatetime] NOT NULL,
	[template_status] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[template_default] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [template_id] PRIMARY KEY CLUSTERED 
(
	[template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[phpkb_templates] ADD  DEFAULT ('active') FOR [template_status]
ALTER TABLE [dbo].[phpkb_templates] ADD  DEFAULT ('no') FOR [template_default]
ALTER TABLE [dbo].[phpkb_templates]  WITH CHECK ADD  CONSTRAINT [fk___author_template] FOREIGN KEY([author_id])
REFERENCES [dbo].[phpkb_authors] ([author_id])
ALTER TABLE [dbo].[phpkb_templates] CHECK CONSTRAINT [fk___author_template]
ALTER TABLE [dbo].[phpkb_templates]  WITH CHECK ADD CHECK  (([template_status]='inactive' OR [template_status]='active'))
ALTER TABLE [dbo].[phpkb_templates]  WITH CHECK ADD CHECK  (([template_default]='no' OR [template_default]='yes'))
GO
