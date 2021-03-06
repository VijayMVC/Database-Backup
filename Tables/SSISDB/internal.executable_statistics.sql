/****** Object:  Table [internal].[executable_statistics]    Script Date: 5/15/2018 12:06:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[executable_statistics](
	[statistics_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[executable_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[execution_hierarchy] [hierarchyid] NULL,
	[execution_duration] [int] NULL,
	[execution_result] [smallint] NULL,
	[execution_value] [sql_variant] NULL,
 CONSTRAINT [PK_Executable_statistics] PRIMARY KEY CLUSTERED 
(
	[statistics_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[executable_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecutableStatistics_ExecutableId_Executables] FOREIGN KEY([executable_id])
REFERENCES [internal].[executables] ([executable_id])
ALTER TABLE [internal].[executable_statistics] CHECK CONSTRAINT [FK_ExecutableStatistics_ExecutableId_Executables]
ALTER TABLE [internal].[executable_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecutableStatistics_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
ALTER TABLE [internal].[executable_statistics] CHECK CONSTRAINT [FK_ExecutableStatistics_ExecutionId_Executions]
GO
