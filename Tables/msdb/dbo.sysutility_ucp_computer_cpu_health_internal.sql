/****** Object:  Table [dbo].[sysutility_ucp_computer_cpu_health_internal]    Script Date: 5/15/2018 12:03:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_computer_cpu_health_internal](
	[physical_server_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[health_state] [int] NOT NULL,
	[set_number] [int] NOT NULL,
	[processing_time] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_sysutility_ucp_computer_cpu_health_internal_name] PRIMARY KEY CLUSTERED 
(
	[set_number] ASC,
	[physical_server_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysutility_ucp_computer_cpu_health_internal] ADD  DEFAULT ((0)) FOR [set_number]
ALTER TABLE [dbo].[sysutility_ucp_computer_cpu_health_internal] ADD  DEFAULT (sysdatetimeoffset()) FOR [processing_time]
GO
