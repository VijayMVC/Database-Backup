/****** Object:  Table [dbo].[SEC_MODULES]    Script Date: 5/15/2018 11:59:13 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SEC_MODULES](
	[ModuleID] [int] NOT NULL,
	[Name] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NULL,
	[DateLastModified] [datetime] NULL
) ON [PRIMARY]

GO
