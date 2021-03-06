/****** Object:  Table [dbo].[sysutility_ucp_managed_instances_internal]    Script Date: 5/15/2018 12:03:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_managed_instances_internal](
	[instance_id] [int] IDENTITY(1,1) NOT NULL,
	[instance_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[virtual_server_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[date_created] [datetimeoffset](7) NOT NULL,
	[created_by] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[agent_proxy_account] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[cache_directory] [nvarchar](520) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[management_state] [int] NOT NULL,
 CONSTRAINT [PK_sysutility_ucp_mi_name] PRIMARY KEY CLUSTERED 
(
	[instance_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_sysutility_ucp_mi_id] UNIQUE NONCLUSTERED 
(
	[instance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysutility_ucp_managed_instances_internal] ADD  DEFAULT (sysdatetimeoffset()) FOR [date_created]
ALTER TABLE [dbo].[sysutility_ucp_managed_instances_internal] ADD  DEFAULT (suser_sname()) FOR [created_by]
ALTER TABLE [dbo].[sysutility_ucp_managed_instances_internal] ADD  DEFAULT ((0)) FOR [management_state]
GO
