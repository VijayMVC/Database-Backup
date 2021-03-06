/****** Object:  Table [dbo].[xf_user_option]    Script Date: 5/15/2018 12:00:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_option](
	[user_id] [bigint] NOT NULL,
	[show_dob_year] [tinyint] NOT NULL,
	[show_dob_date] [tinyint] NOT NULL,
	[content_show_signature] [tinyint] NOT NULL,
	[receive_admin_email] [tinyint] NOT NULL,
	[email_on_conversation] [tinyint] NOT NULL,
	[is_discouraged] [tinyint] NOT NULL,
	[default_watch_state] [nvarchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[alert_optout] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[enable_rte] [tinyint] NOT NULL,
	[enable_flash_uploader] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_user_option_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [show_dob_year]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [show_dob_date]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [content_show_signature]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [receive_admin_email]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [email_on_conversation]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((0)) FOR [is_discouraged]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT (N'') FOR [default_watch_state]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [enable_rte]
ALTER TABLE [dbo].[xf_user_option] ADD  DEFAULT ((1)) FOR [enable_flash_uploader]
GO
