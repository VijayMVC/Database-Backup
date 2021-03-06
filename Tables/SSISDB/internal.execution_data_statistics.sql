/****** Object:  Table [internal].[execution_data_statistics]    Script Date: 5/15/2018 12:06:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[execution_data_statistics](
	[data_stats_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_name] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[package_location_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_path_full] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[task_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dataflow_path_id_string] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dataflow_path_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[source_component_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[destination_component_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[rows_sent] [bigint] NULL,
	[created_time] [datetimeoffset](7) NULL,
	[execution_path] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Execution_data_statistics] PRIMARY KEY CLUSTERED 
(
	[data_stats_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[execution_data_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecDataStat_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
ALTER TABLE [internal].[execution_data_statistics] CHECK CONSTRAINT [FK_ExecDataStat_ExecutionId_Executions]
GO
