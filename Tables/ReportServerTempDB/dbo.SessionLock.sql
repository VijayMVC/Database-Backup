/****** Object:  Table [dbo].[SessionLock]    Script Date: 5/15/2018 12:05:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SessionLock](
	[SessionID] [varchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LockVersion] [int] NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IDX_SessionLock]    Script Date: 5/15/2018 12:05:06 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IDX_SessionLock] ON [dbo].[SessionLock]
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[SessionLock] ADD  DEFAULT ((0)) FOR [LockVersion]
GO
