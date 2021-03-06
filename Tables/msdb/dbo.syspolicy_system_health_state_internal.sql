/****** Object:  Table [dbo].[syspolicy_system_health_state_internal]    Script Date: 5/15/2018 12:03:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[syspolicy_system_health_state_internal](
	[health_state_id] [bigint] IDENTITY(1,1) NOT NULL,
	[policy_id] [int] NOT NULL,
	[last_run_date] [datetime] NOT NULL,
	[target_query_expression_with_id] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[target_query_expression] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[result] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[health_state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_syspolicy_system_health_state_internal_policy_id]    Script Date: 5/15/2018 12:03:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_syspolicy_system_health_state_internal_policy_id] ON [dbo].[syspolicy_system_health_state_internal]
(
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_syspolicy_system_health_state_internal_target_query_expression_with_id]    Script Date: 5/15/2018 12:03:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_syspolicy_system_health_state_internal_target_query_expression_with_id] ON [dbo].[syspolicy_system_health_state_internal]
(
	[target_query_expression_with_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[syspolicy_system_health_state_internal]  WITH CHECK ADD FOREIGN KEY([policy_id])
REFERENCES [dbo].[syspolicy_policies_internal] ([policy_id])
GO
