/****** Object:  Table [dbo].[DBUpgradeHistory]    Script Date: 5/15/2018 12:04:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DBUpgradeHistory](
	[UpgradeID] [bigint] IDENTITY(1,1) NOT NULL,
	[DbVersion] [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[User] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_DBUpgradeHistory] PRIMARY KEY CLUSTERED 
(
	[UpgradeID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DBUpgradeHistory] ADD  DEFAULT (suser_sname()) FOR [User]
ALTER TABLE [dbo].[DBUpgradeHistory] ADD  DEFAULT (getdate()) FOR [DateTime]
GO
