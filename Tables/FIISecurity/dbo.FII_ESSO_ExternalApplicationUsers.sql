/****** Object:  Table [dbo].[FII_ESSO_ExternalApplicationUsers]    Script Date: 5/15/2018 12:00:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FII_ESSO_ExternalApplicationUsers](
	[ExternalAppUserID] [int] IDENTITY(1000001,1) NOT NULL,
	[FIIUserID] [int] NOT NULL,
	[ExternalAppId] [int] NOT NULL,
	[ExternalAppLoginID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalAppPassword] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PasswordEncryptionKey] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Active] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ExternalUser] PRIMARY KEY CLUSTERED 
(
	[ExternalAppUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_FII_ESSO_ExternalApplicationUser_25_1326627769__K3_K2_K7_1_4_5_6]    Script Date: 5/15/2018 12:00:02 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_FII_ESSO_ExternalApplicationUser_25_1326627769__K3_K2_K7_1_4_5_6] ON [dbo].[FII_ESSO_ExternalApplicationUsers]
(
	[ExternalAppId] ASC,
	[FIIUserID] ASC,
	[Active] ASC
)
INCLUDE ( 	[ExternalAppUserID],
	[ExternalAppLoginID],
	[ExternalAppPassword],
	[PasswordEncryptionKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers] ADD  CONSTRAINT [DF_ExternalApplicationsUser_Active]  DEFAULT ((1)) FOR [Active]
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers] ADD  CONSTRAINT [DF_ExternalApplicationsUser_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers] ADD  CONSTRAINT [DF_ExternalApplicationsUser_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers]  WITH CHECK ADD  CONSTRAINT [FK_FII_ESSO_ExternalApplicationUsers_FII_ESSO_ExternalApplications] FOREIGN KEY([ExternalAppId])
REFERENCES [dbo].[FII_ESSO_ExternalApplications] ([ExternalAppID])
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers] CHECK CONSTRAINT [FK_FII_ESSO_ExternalApplicationUsers_FII_ESSO_ExternalApplications]
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers]  WITH CHECK ADD  CONSTRAINT [FK_FII_ESSO_ExternalApplicationUsers_FIIUser] FOREIGN KEY([FIIUserID])
REFERENCES [dbo].[FIIUser] ([UserID])
ALTER TABLE [dbo].[FII_ESSO_ExternalApplicationUsers] CHECK CONSTRAINT [FK_FII_ESSO_ExternalApplicationUsers_FIIUser]
GO
