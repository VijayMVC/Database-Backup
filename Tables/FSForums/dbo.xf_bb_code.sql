/****** Object:  Table [dbo].[xf_bb_code]    Script Date: 5/15/2018 12:00:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_bb_code](
	[bb_code_id] [varbinary](25) NOT NULL,
	[bb_code_mode] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[has_option] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replace_html] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replace_html_email] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[replace_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[callback_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[callback_method] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[option_regex] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[trim_lines_after] [tinyint] NOT NULL,
	[plain_children] [tinyint] NOT NULL,
	[disable_smilies] [tinyint] NOT NULL,
	[disable_nl2br] [tinyint] NOT NULL,
	[disable_autolink] [tinyint] NOT NULL,
	[allow_signature] [tinyint] NOT NULL,
	[editor_icon_url] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sprite_mode] [tinyint] NOT NULL,
	[sprite_params] [varbinary](max) NOT NULL,
	[example] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[active] [tinyint] NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
 CONSTRAINT [PK_xf_bb_code_bb_code_id] PRIMARY KEY CLUSTERED 
(
	[bb_code_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT (N'') FOR [callback_class]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT (N'') FOR [callback_method]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((0)) FOR [trim_lines_after]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((0)) FOR [plain_children]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((0)) FOR [disable_smilies]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((0)) FOR [disable_nl2br]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((0)) FOR [disable_autolink]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((1)) FOR [allow_signature]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT (N'') FOR [editor_icon_url]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((0)) FOR [sprite_mode]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT ((1)) FOR [active]
ALTER TABLE [dbo].[xf_bb_code] ADD  DEFAULT (0x) FOR [addon_id]
GO
