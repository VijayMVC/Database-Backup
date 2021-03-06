/****** Object:  Table [internal].[object_versions]    Script Date: 5/15/2018 12:06:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[object_versions](
	[object_version_lsn] [bigint] IDENTITY(1,1) NOT NULL,
	[object_id] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[description] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_by] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
	[restored_by] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_restored_time] [datetimeoffset](7) NULL,
	[object_data] [varbinary](max) NOT NULL,
	[object_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Object_Versions] PRIMARY KEY CLUSTERED 
(
	[object_version_lsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
