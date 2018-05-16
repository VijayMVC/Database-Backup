/****** Object:  Table [dbo].[_zw_ExactTargetLog]    Script Date: 5/15/2018 12:00:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_zw_ExactTargetLog](
	[pk_id] [int] IDENTITY(1,1) NOT NULL,
	[occurred] [datetime] NULL,
	[sender] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[logEntry] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
