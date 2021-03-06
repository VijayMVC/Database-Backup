/****** Object:  Table [dbo].[SEC_CATEGORIES]    Script Date: 5/15/2018 11:59:13 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SEC_CATEGORIES](
	[category_id] [int] NOT NULL,
	[name] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[grouping] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateLastModified] [datetime] NULL
) ON [PRIMARY]

GO
