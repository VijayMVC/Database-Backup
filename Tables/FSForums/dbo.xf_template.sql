/****** Object:  Table [dbo].[xf_template]    Script Date: 5/15/2018 12:00:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_template](
	[template_id] [bigint] IDENTITY(1807,1) NOT NULL,
	[title] [varbinary](50) NOT NULL,
	[style_id] [bigint] NOT NULL,
	[template] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[template_parsed] [varbinary](max) NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
	[version_id] [bigint] NOT NULL,
	[version_string] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[disable_modifications] [tinyint] NOT NULL,
	[last_edit_date] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_template_template_id] PRIMARY KEY CLUSTERED 
(
	[template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_template$title_style_id] UNIQUE NONCLUSTERED 
(
	[title] ASC,
	[style_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[xf_template] ADD  DEFAULT (0x) FOR [addon_id]
ALTER TABLE [dbo].[xf_template] ADD  DEFAULT ((0)) FOR [version_id]
ALTER TABLE [dbo].[xf_template] ADD  DEFAULT (N'') FOR [version_string]
ALTER TABLE [dbo].[xf_template] ADD  DEFAULT ((0)) FOR [disable_modifications]
ALTER TABLE [dbo].[xf_template] ADD  DEFAULT ((0)) FOR [last_edit_date]
GO
