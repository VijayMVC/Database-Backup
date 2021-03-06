/****** Object:  Table [dbo].[Users]    Script Date: 5/15/2018 12:05:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[Sid] [varbinary](85) NULL,
	[UserType] [int] NOT NULL,
	[AuthType] [int] NOT NULL,
	[UserName] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_Users]    Script Date: 5/15/2018 12:05:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[Sid] ASC,
	[UserName] ASC,
	[AuthType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
