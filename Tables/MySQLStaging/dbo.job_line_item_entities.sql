/****** Object:  Table [dbo].[job_line_item_entities]    Script Date: 5/15/2018 12:04:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[job_line_item_entities](
	[job_line_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[role_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_job_line_item_entities_job_line_item_id] PRIMARY KEY CLUSTERED 
(
	[job_line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[job_line_item_entities] ADD  DEFAULT (NULL) FOR [entity_id]
ALTER TABLE [dbo].[job_line_item_entities] ADD  DEFAULT (NULL) FOR [role_id]
GO
