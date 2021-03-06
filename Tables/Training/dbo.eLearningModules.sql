/****** Object:  Table [dbo].[eLearningModules]    Script Date: 5/15/2018 12:07:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[eLearningModules](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GraphicName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Duration] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Audience] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Download] [bit] NULL,
	[Email] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModuleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AW] [bit] NULL,
	[Header] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_eLearningModules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
