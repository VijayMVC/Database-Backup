/****** Object:  Table [dbo].[GoldmineToAlpineLog]    Script Date: 5/15/2018 11:58:38 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GoldmineToAlpineLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Process] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ErrorMessage] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
