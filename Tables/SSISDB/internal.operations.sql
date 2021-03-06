/****** Object:  Table [internal].[operations]    Script Date: 5/15/2018 12:06:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[operations](
	[operation_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_type] [smallint] NOT NULL,
	[created_time] [datetimeoffset](7) NULL,
	[object_type] [smallint] NULL,
	[object_id] [bigint] NULL,
	[object_name] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[caller_sid] [varbinary](85) NOT NULL,
	[caller_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[process_id] [int] NULL,
	[stopped_by_sid] [varbinary](85) NULL,
	[stopped_by_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[operation_guid] [uniqueidentifier] NULL,
	[server_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[machine_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[operation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
