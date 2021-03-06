/****** Object:  Table [dbo].[sysproxylogin]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysproxylogin](
	[proxy_id] [int] NOT NULL,
	[sid] [varbinary](85) NULL,
	[flags] [int] NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [clust]    Script Date: 5/15/2018 12:03:11 PM ******/
CREATE UNIQUE CLUSTERED INDEX [clust] ON [dbo].[sysproxylogin]
(
	[proxy_id] ASC,
	[sid] ASC,
	[flags] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[sysproxylogin] ADD  DEFAULT ((0)) FOR [flags]
GO
