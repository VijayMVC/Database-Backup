/****** Object:  Table [Utility].[States]    Script Date: 5/15/2018 11:59:58 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Utility].[States](
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateFullName] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountryCode]  AS (CONVERT([char](2),'US',0))
) ON [PRIMARY]

GO
