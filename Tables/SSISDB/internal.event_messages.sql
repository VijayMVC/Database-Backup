/****** Object:  Table [internal].[event_messages]    Script Date: 5/15/2018 12:06:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[event_messages](
	[event_message_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_name] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_location_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_path_full] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[event_name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[message_source_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[message_source_id] [nvarchar](38) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subcomponent_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_path] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[threadID] [int] NOT NULL,
	[message_code] [int] NULL,
 CONSTRAINT [PK_Event_Messages] PRIMARY KEY CLUSTERED 
(
	[event_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[event_messages]  WITH CHECK ADD  CONSTRAINT [FK_EventMessage_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
ALTER TABLE [internal].[event_messages] CHECK CONSTRAINT [FK_EventMessage_Operations]
ALTER TABLE [internal].[event_messages]  WITH CHECK ADD  CONSTRAINT [FK_EventMessages_OperationMessageId_OperationMessage] FOREIGN KEY([event_message_id])
REFERENCES [internal].[operation_messages] ([operation_message_id])
ON DELETE CASCADE
ALTER TABLE [internal].[event_messages] CHECK CONSTRAINT [FK_EventMessages_OperationMessageId_OperationMessage]
GO
