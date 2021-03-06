/****** Object:  Table [dbo].[sysutility_ucp_aggregated_dac_health_internal]    Script Date: 5/15/2018 12:03:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal](
	[dac_count] [int] NOT NULL,
	[dac_healthy_count] [int] NOT NULL,
	[dac_unhealthy_count] [int] NOT NULL,
	[dac_over_utilize_count] [int] NOT NULL,
	[dac_under_utilize_count] [int] NOT NULL,
	[dac_on_over_utilized_computer_count] [int] NOT NULL,
	[dac_on_under_utilized_computer_count] [int] NOT NULL,
	[dac_with_files_on_over_utilized_volume_count] [int] NOT NULL,
	[dac_with_files_on_under_utilized_volume_count] [int] NOT NULL,
	[dac_with_over_utilized_file_count] [int] NOT NULL,
	[dac_with_under_utilized_file_count] [int] NOT NULL,
	[dac_with_over_utilized_processor_count] [int] NOT NULL,
	[dac_with_under_utilized_processor_count] [int] NOT NULL,
	[set_number] [int] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_healthy_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_unhealthy_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_over_utilize_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_under_utilize_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_on_over_utilized_computer_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_on_under_utilized_computer_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_with_files_on_over_utilized_volume_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_with_files_on_under_utilized_volume_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_with_over_utilized_file_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_with_under_utilized_file_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_with_over_utilized_processor_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [dac_with_under_utilized_processor_count]
ALTER TABLE [dbo].[sysutility_ucp_aggregated_dac_health_internal] ADD  DEFAULT ((0)) FOR [set_number]
GO
