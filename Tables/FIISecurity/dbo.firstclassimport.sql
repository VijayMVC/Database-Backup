/****** Object:  Table [dbo].[firstclassimport]    Script Date: 5/15/2018 12:00:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[firstclassimport](
	[TempKey] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OriginalUsername] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Firstname] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lastname] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[emailaddress] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Originalemailaddress] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[webnumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[exported] [bit] NULL,
	[donotexport] [bit] NULL,
	[actiononuser] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[firstclassimport] ADD  CONSTRAINT [DF_firstclassimport_exported]  DEFAULT ((0)) FOR [exported]
ALTER TABLE [dbo].[firstclassimport] ADD  CONSTRAINT [DF_firstclassimport_donotexport]  DEFAULT ((0)) FOR [donotexport]
GO
