/****** Object:  Table [dbo].[xf_phrase]    Script Date: 5/15/2018 12:00:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_phrase](
	[phrase_id] [bigint] IDENTITY(19769,1) NOT NULL,
	[language_id] [bigint] NOT NULL,
	[title] [varbinary](100) NOT NULL,
	[phrase_text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[global_cache] [tinyint] NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
	[version_id] [bigint] NOT NULL,
	[version_string] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_phrase_phrase_id] PRIMARY KEY CLUSTERED 
(
	[phrase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_phrase$title] UNIQUE NONCLUSTERED 
(
	[title] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [language_id_global_cache]    Script Date: 5/15/2018 12:00:29 PM ******/
CREATE NONCLUSTERED INDEX [language_id_global_cache] ON [dbo].[xf_phrase]
(
	[language_id] ASC,
	[global_cache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_phrase] ADD  DEFAULT ((0)) FOR [global_cache]
ALTER TABLE [dbo].[xf_phrase] ADD  DEFAULT (0x) FOR [addon_id]
ALTER TABLE [dbo].[xf_phrase] ADD  DEFAULT ((0)) FOR [version_id]
ALTER TABLE [dbo].[xf_phrase] ADD  DEFAULT (N'') FOR [version_string]
GO
