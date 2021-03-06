/****** Object:  Table [dbo].[xf_bdmedal_medal]    Script Date: 5/15/2018 12:00:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_bdmedal_medal](
	[medal_id] [bigint] IDENTITY(4,1) NOT NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[category_id] [bigint] NOT NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[display_order] [bigint] NULL,
	[user_count] [bigint] NULL,
	[last_award_date] [bigint] NULL,
	[last_award_user_id] [bigint] NULL,
	[last_award_username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_date] [bigint] NULL,
 CONSTRAINT [PK_xf_bdmedal_medal_medal_id] PRIMARY KEY CLUSTERED 
(
	[medal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [category_id]    Script Date: 5/15/2018 12:00:17 PM ******/
CREATE NONCLUSTERED INDEX [category_id] ON [dbo].[xf_bdmedal_medal]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_bdmedal_medal] ADD  DEFAULT ((0)) FOR [display_order]
ALTER TABLE [dbo].[xf_bdmedal_medal] ADD  DEFAULT ((0)) FOR [user_count]
ALTER TABLE [dbo].[xf_bdmedal_medal] ADD  DEFAULT ((0)) FOR [last_award_date]
ALTER TABLE [dbo].[xf_bdmedal_medal] ADD  DEFAULT ((0)) FOR [last_award_user_id]
ALTER TABLE [dbo].[xf_bdmedal_medal] ADD  DEFAULT (N'') FOR [last_award_username]
ALTER TABLE [dbo].[xf_bdmedal_medal] ADD  DEFAULT ((0)) FOR [image_date]
GO
