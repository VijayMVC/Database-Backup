/****** Object:  Table [internal].[execution_property_override_values]    Script Date: 5/15/2018 12:06:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[execution_property_override_values](
	[property_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[property_path] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[property_value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sensitive_property_value] [varbinary](max) NULL,
	[sensitive] [bit] NOT NULL,
 CONSTRAINT [PK_Execution_Property_Override_Value] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[execution_property_override_values]  WITH CHECK ADD  CONSTRAINT [FK_ExecutionPropertyOverrideValue_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
ALTER TABLE [internal].[execution_property_override_values] CHECK CONSTRAINT [FK_ExecutionPropertyOverrideValue_ExecutionId_Executions]
GO
