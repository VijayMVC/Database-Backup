/****** Object:  Table [internal].[object_parameters]    Script Date: 5/15/2018 12:06:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[object_parameters](
	[parameter_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[project_version_lsn] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[object_name] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parameter_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parameter_data_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[required] [bit] NOT NULL,
	[sensitive] [bit] NOT NULL,
	[description] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[design_default_value] [sql_variant] NULL,
	[default_value] [sql_variant] NULL,
	[sensitive_default_value] [varbinary](max) NULL,
	[base_data_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[value_type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[value_set] [bit] NOT NULL,
	[referenced_variable_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[validation_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Object_Parameters] PRIMARY KEY CLUSTERED 
(
	[parameter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [internal].[object_parameters]  WITH CHECK ADD  CONSTRAINT [FK_ObjectParameters_ProjectId_Projects] FOREIGN KEY([project_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
ALTER TABLE [internal].[object_parameters] CHECK CONSTRAINT [FK_ObjectParameters_ProjectId_Projects]
ALTER TABLE [internal].[object_parameters]  WITH CHECK ADD  CONSTRAINT [FK_ObjectParameters_ProjectVersionLsn_ObjectVersions] FOREIGN KEY([project_version_lsn])
REFERENCES [internal].[object_versions] ([object_version_lsn])
ON DELETE CASCADE
ALTER TABLE [internal].[object_parameters] CHECK CONSTRAINT [FK_ObjectParameters_ProjectVersionLsn_ObjectVersions]
GO
