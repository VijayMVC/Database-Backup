/****** Object:  Table [internal].[operation_messages]    Script Date: 5/15/2018 12:06:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[operation_messages](
	[operation_message_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[message_time] [datetimeoffset](7) NOT NULL,
	[message_type] [smallint] NOT NULL,
	[message_source_type] [smallint] NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[extended_info_id] [bigint] NULL,
 CONSTRAINT [PK_Operation_Messages] PRIMARY KEY CLUSTERED 
(
	[operation_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[operation_messages]  WITH CHECK ADD  CONSTRAINT [FK_OperationMessages_OperationId_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
ALTER TABLE [internal].[operation_messages] CHECK CONSTRAINT [FK_OperationMessages_OperationId_Operations]
GO
