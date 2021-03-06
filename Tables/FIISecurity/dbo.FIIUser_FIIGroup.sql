/****** Object:  Table [dbo].[FIIUser_FIIGroup]    Script Date: 5/15/2018 12:00:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FIIUser_FIIGroup](
	[User_GroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_sec_User_Group] PRIMARY KEY CLUSTERED 
(
	[User_GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_FIIUser_FIIGroup_UserID_includes]    Script Date: 5/15/2018 12:00:04 PM ******/
CREATE NONCLUSTERED INDEX [idx_FIIUser_FIIGroup_UserID_includes] ON [dbo].[FIIUser_FIIGroup]
(
	[UserID] ASC
)
INCLUDE ( 	[GroupID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[FIIUser_FIIGroup]  WITH CHECK ADD  CONSTRAINT [FK_fiiUser_fiiGroup_fiiGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[FIIGroup] ([GroupID])
ALTER TABLE [dbo].[FIIUser_FIIGroup] CHECK CONSTRAINT [FK_fiiUser_fiiGroup_fiiGroup]
ALTER TABLE [dbo].[FIIUser_FIIGroup]  WITH CHECK ADD  CONSTRAINT [FK_fiiUser_fiiGroup_fiiUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FIIUser] ([UserID])
ALTER TABLE [dbo].[FIIUser_FIIGroup] CHECK CONSTRAINT [FK_fiiUser_fiiGroup_fiiUser]
GO
