/****** Object:  Table [dbo].[sysproxysubsystem]    Script Date: 5/15/2018 12:03:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysproxysubsystem](
	[subsystem_id] [int] NOT NULL,
	[proxy_id] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [clust]    Script Date: 5/15/2018 12:03:11 PM ******/
CREATE UNIQUE CLUSTERED INDEX [clust] ON [dbo].[sysproxysubsystem]
(
	[subsystem_id] ASC,
	[proxy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
