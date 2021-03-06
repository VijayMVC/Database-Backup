/****** Object:  Table [dbo].[ServerUpgradeHistory]    Script Date: 5/15/2018 12:02:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ServerUpgradeHistory](
	[UpgradeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ServerVersion] [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[User] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_ServerUpgradeHistory] PRIMARY KEY CLUSTERED 
(
	[UpgradeID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ServerUpgradeHistory] ADD  DEFAULT (suser_sname()) FOR [User]
ALTER TABLE [dbo].[ServerUpgradeHistory] ADD  DEFAULT (getdate()) FOR [DateTime]
GO
