/****** Object:  Table [dbo].[UserName]    Script Date: 5/15/2018 12:07:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[UserName](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ParentID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[LoginName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ForcePWChange] [bit] NULL,
	[SecurityTemplateID] [int] NULL,
	[SecurityRightTemplateID] [int] NULL,
	[LastWebAccess] [datetime] NULL,
	[UserLicenseType] [int] NULL,
	[PartialTemplateType] [int] NULL,
	[LoginToControl] [bit] NULL,
	[LoginToWebPro] [bit] NULL,
	[WebProSecurityTempID] [int] NULL,
	[LastPWChangeDate] [datetime] NULL,
	[PriorPasswords] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [UserName_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Index_UserName_LoginName]    Script Date: 5/15/2018 12:07:03 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserName_LoginName] ON [dbo].[UserName]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_UserName_ParentID]    Script Date: 5/15/2018 12:07:03 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserName_ParentID] ON [dbo].[UserName]
(
	[ParentID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_UserName_SecurityTemplateID]    Script Date: 5/15/2018 12:07:03 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserName_SecurityTemplateID] ON [dbo].[UserName]
(
	[SecurityTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
