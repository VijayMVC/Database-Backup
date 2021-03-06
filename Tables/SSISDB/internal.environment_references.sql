/****** Object:  Table [internal].[environment_references]    Script Date: 5/15/2018 12:06:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[environment_references](
	[reference_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[reference_type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[environment_folder_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[environment_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[validation_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_environment_references] PRIMARY KEY CLUSTERED 
(
	[reference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [internal].[environment_references]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEnvironment_ProjectId_Projects] FOREIGN KEY([project_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
ALTER TABLE [internal].[environment_references] CHECK CONSTRAINT [FK_ProjectEnvironment_ProjectId_Projects]
GO
