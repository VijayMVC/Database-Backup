/****** Object:  Table [dbo].[awLogModules]    Script Date: 5/15/2018 12:07:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[awLogModules](
	[awLogModuleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ModuleID] [int] NULL,
	[WebID] [int] NULL,
	[DateAccessed] [datetime] NULL,
 CONSTRAINT [PK_awLogModules] PRIMARY KEY CLUSTERED 
(
	[awLogModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[awLogModules]  WITH CHECK ADD  CONSTRAINT [FK_awLogModules_AWUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AWUsers] ([UserID])
ALTER TABLE [dbo].[awLogModules] CHECK CONSTRAINT [FK_awLogModules_AWUsers]
ALTER TABLE [dbo].[awLogModules]  WITH CHECK ADD  CONSTRAINT [FK_awLogModules_eLearningModules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[eLearningModules] ([ID])
ALTER TABLE [dbo].[awLogModules] CHECK CONSTRAINT [FK_awLogModules_eLearningModules]
GO
