/****** Object:  Table [dbo].[sysutility_ucp_filegroups_with_policy_violations_internal]    Script Date: 5/15/2018 12:03:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_filegroups_with_policy_violations_internal](
	[server_instance_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[database_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[filegroup_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[policy_id] [int] NOT NULL,
	[set_number] [int] NOT NULL,
 CONSTRAINT [PK_sysutility_ucp_filegroups_with_policy_violations_internal] PRIMARY KEY CLUSTERED 
(
	[set_number] ASC,
	[policy_id] ASC,
	[server_instance_name] ASC,
	[database_name] ASC,
	[filegroup_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
