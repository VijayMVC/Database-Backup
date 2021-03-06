/****** Object:  Table [dbo].[sysutility_ucp_processing_state_internal]    Script Date: 5/15/2018 12:03:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
CREATE TABLE [dbo].[sysutility_ucp_processing_state_internal](
	[latest_processing_time] [datetimeoffset](7) NULL,
	[latest_health_state_id] [int] NULL,
	[next_health_state_id] [int] NULL,
	[id]  AS ((1)),
 CONSTRAINT [PK_sysutility_ucp_processing_state_internal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysutility_ucp_processing_state_internal]  WITH CHECK ADD  CONSTRAINT [CK_sysutility_ucp_processing_state_internal] CHECK  (([latest_health_state_id]<=[next_health_state_id]))
ALTER TABLE [dbo].[sysutility_ucp_processing_state_internal] CHECK CONSTRAINT [CK_sysutility_ucp_processing_state_internal]
GO
