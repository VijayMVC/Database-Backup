/****** Object:  Table [dbo].[sec_ApplicationRoles]    Script Date: 5/15/2018 12:00:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sec_ApplicationRoles](
	[application_role_id] [bigint] IDENTITY(40,1) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[role_desc] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[role_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[application_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sec_ApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationRoles_Applications] FOREIGN KEY([application_id])
REFERENCES [dbo].[sec_Applications] ([application_id])
ALTER TABLE [dbo].[sec_ApplicationRoles] CHECK CONSTRAINT [FK_ApplicationRoles_Applications]
GO
