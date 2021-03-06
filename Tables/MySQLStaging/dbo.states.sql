/****** Object:  Table [dbo].[states]    Script Date: 5/15/2018 12:04:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[states](
	[state_id] [int] IDENTITY(3845,1) NOT NULL,
	[code] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[country_id] [int] NOT NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_states_state_id] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [country_id]    Script Date: 5/15/2018 12:04:31 PM ******/
CREATE NONCLUSTERED INDEX [country_id] ON [dbo].[states]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[states] ADD  DEFAULT (NULL) FOR [code]
ALTER TABLE [dbo].[states] ADD  DEFAULT (NULL) FOR [name]
ALTER TABLE [dbo].[states] ADD  DEFAULT ((1)) FOR [active]
GO
