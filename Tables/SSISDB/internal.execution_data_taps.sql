/****** Object:  Table [internal].[execution_data_taps]    Script Date: 5/15/2018 12:06:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[execution_data_taps](
	[data_tap_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_path] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dataflow_path_id_string] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dataflow_task_guid] [uniqueidentifier] NULL,
	[max_rows] [int] NULL,
	[filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Execution_data_taps] PRIMARY KEY CLUSTERED 
(
	[data_tap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[execution_data_taps]  WITH CHECK ADD  CONSTRAINT [FK_ExecDataTaps_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
ALTER TABLE [internal].[execution_data_taps] CHECK CONSTRAINT [FK_ExecDataTaps_ExecutionId_Executions]
GO
