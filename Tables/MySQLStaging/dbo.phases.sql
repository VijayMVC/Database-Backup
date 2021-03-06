/****** Object:  Table [dbo].[phases]    Script Date: 5/15/2018 12:04:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phases](
	[phase_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parent_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[keyword] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[color] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[order] [int] NOT NULL,
	[date_range] [smallint] NOT NULL,
	[assignable] [smallint] NOT NULL,
	[alias_nm] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_phases_phase_id] PRIMARY KEY CLUSTERED 
(
	[phase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [parent_id]    Script Date: 5/15/2018 12:04:23 PM ******/
CREATE NONCLUSTERED INDEX [parent_id] ON [dbo].[phases]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[phases] ADD  DEFAULT (NULL) FOR [parent_id]
ALTER TABLE [dbo].[phases] ADD  DEFAULT (NULL) FOR [color]
ALTER TABLE [dbo].[phases] ADD  DEFAULT ((1)) FOR [assignable]
ALTER TABLE [dbo].[phases] ADD  DEFAULT (NULL) FOR [alias_nm]
GO
