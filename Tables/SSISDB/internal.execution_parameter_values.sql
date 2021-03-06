/****** Object:  Table [internal].[execution_parameter_values]    Script Date: 5/15/2018 12:06:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[execution_parameter_values](
	[execution_parameter_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[parameter_data_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parameter_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parameter_value] [sql_variant] NULL,
	[sensitive_parameter_value] [varbinary](max) NULL,
	[base_data_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sensitive] [bit] NOT NULL,
	[required] [bit] NOT NULL,
	[value_set] [bit] NOT NULL,
	[runtime_override] [bit] NOT NULL,
 CONSTRAINT [PK_Execution_Parameter_value] PRIMARY KEY CLUSTERED 
(
	[execution_parameter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_ExecutionParameterValue_ExecutionId]    Script Date: 5/15/2018 12:06:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExecutionParameterValue_ExecutionId] ON [internal].[execution_parameter_values]
(
	[execution_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [internal].[execution_parameter_values]  WITH CHECK ADD  CONSTRAINT [FK_ExecutionParameterValue_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
ALTER TABLE [internal].[execution_parameter_values] CHECK CONSTRAINT [FK_ExecutionParameterValue_ExecutionId_Executions]
GO
