/****** Object:  Table [dbo].[sysutility_ucp_space_utilization_stub]    Script Date: 5/15/2018 12:03:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_space_utilization_stub](
	[processing_time] [datetimeoffset](7) NOT NULL,
	[aggregation_type] [tinyint] NOT NULL,
	[object_type] [tinyint] NOT NULL,
	[virtual_server_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[server_instance_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[volume_device_id] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[database_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[filegroup_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[dbfile_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[used_space_bytes] [real] NULL,
	[allocated_space_bytes] [real] NULL,
	[total_space_bytes] [real] NULL,
	[available_space_bytes] [real] NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[sysutility_ucp_space_utilization_stub] ADD  DEFAULT ('') FOR [virtual_server_name]
ALTER TABLE [dbo].[sysutility_ucp_space_utilization_stub] ADD  DEFAULT ('') FOR [server_instance_name]
ALTER TABLE [dbo].[sysutility_ucp_space_utilization_stub] ADD  DEFAULT ('') FOR [volume_device_id]
ALTER TABLE [dbo].[sysutility_ucp_space_utilization_stub] ADD  DEFAULT ('') FOR [database_name]
ALTER TABLE [dbo].[sysutility_ucp_space_utilization_stub] ADD  DEFAULT ('') FOR [filegroup_name]
ALTER TABLE [dbo].[sysutility_ucp_space_utilization_stub] ADD  DEFAULT ('') FOR [dbfile_name]
GO
