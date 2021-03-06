/****** Object:  Table [Control].[PackageExecution]    Script Date: 5/15/2018 11:59:50 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Control].[PackageExecution](
	[PackageName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastStartDate] [datetime] NULL,
	[LastEndDate] [datetime] NULL,
	[PackageSucceeded] [bit] NULL,
	[LastSuccessfulStart] [datetime] NULL,
	[LastSuccessfulEnd] [datetime] NULL
) ON [PRIMARY]

ALTER TABLE [Control].[PackageExecution] ADD  CONSTRAINT [DF_PackageExecution_JobSucceeded]  DEFAULT ((0)) FOR [PackageSucceeded]
GO
