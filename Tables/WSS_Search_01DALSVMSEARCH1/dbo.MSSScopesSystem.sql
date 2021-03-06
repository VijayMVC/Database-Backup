/****** Object:  Table [dbo].[MSSScopesSystem]    Script Date: 5/15/2018 12:09:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSScopesSystem](
	[LastChangeID] [int] NOT NULL,
	[LastCompilationID] [int] NOT NULL,
	[LastCompilationTime] [datetime] NOT NULL,
	[CompilationScheduleType] [smallint] NOT NULL,
	[NextCompilationTime] [datetime] NOT NULL,
	[CustomCompilationSchedule] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[AverageCompilationDuration] [int] NOT NULL,
	[CompilationState] [smallint] NOT NULL,
	[CompilationChangeID] [int] NOT NULL,
	[CompilationStartTime] [datetime] NOT NULL,
	[CompilationPercentComplete] [smallint] NOT NULL,
	[StartCompilation] [bit] NOT NULL,
	[StopCompilation] [bit] NOT NULL,
	[QueryServers] [int] NOT NULL,
	[QueryServersDone] [int] NOT NULL,
	[LastConsumerChangeID] [int] NOT NULL
) ON [PRIMARY]

GO
