/****** Object:  Table [dbo].[xf_widget]    Script Date: 5/15/2018 12:00:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_widget](
	[widget_id] [bigint] IDENTITY(17,1) NOT NULL,
	[title] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[class] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[options] [varbinary](max) NULL,
	[position] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[display_order] [int] NULL,
	[active] [tinyint] NULL,
	[template_for_hooks] [varbinary](max) NULL,
	[widget_page_id] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_widget_widget_id] PRIMARY KEY CLUSTERED 
(
	[widget_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[xf_widget] ADD  DEFAULT ((0)) FOR [display_order]
ALTER TABLE [dbo].[xf_widget] ADD  DEFAULT ((1)) FOR [active]
ALTER TABLE [dbo].[xf_widget] ADD  DEFAULT ((0)) FOR [widget_page_id]
GO
