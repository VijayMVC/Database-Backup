/****** Object:  Table [dbo].[MIPScheduledJob]    Script Date: 5/15/2018 12:05:10 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MIPScheduledJob](
	[JobId] [uniqueidentifier] NOT NULL,
	[Assembly] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Class] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Recurrence] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[JobData] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[NextDueTime] [datetime] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[DisplayName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
