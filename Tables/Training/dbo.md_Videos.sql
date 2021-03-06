/****** Object:  Table [dbo].[md_Videos]    Script Date: 5/15/2018 12:07:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[md_Videos](
	[VideoID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Length] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventTitle] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventDate] [datetime] NULL,
	[MovRefUploadDate] [datetime] NULL
) ON [PRIMARY]

GO
