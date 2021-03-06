/****** Object:  Table [dbo].[help]    Script Date: 5/15/2018 12:04:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[help](
	[help_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[reference] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[module] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [tinyint] NOT NULL,
	[message_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_help_help_id] PRIMARY KEY CLUSTERED 
(
	[help_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [active]    Script Date: 5/15/2018 12:04:12 PM ******/
CREATE NONCLUSTERED INDEX [active] ON [dbo].[help]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[help] ADD  DEFAULT (N'Action') FOR [type]
ALTER TABLE [dbo].[help] ADD  DEFAULT (NULL) FOR [module]
ALTER TABLE [dbo].[help] ADD  DEFAULT ((1)) FOR [active]
GO
