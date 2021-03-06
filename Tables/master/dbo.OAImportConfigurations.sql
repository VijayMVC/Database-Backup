/****** Object:  Table [dbo].[OAImportConfigurations]    Script Date: 5/15/2018 12:02:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OAImportConfigurations](
	[Name] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DisplayName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BaseTypeName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BaseConnectionString] [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BaseIsUpdateRequired] [tinyint] NOT NULL,
	[SourceTypeName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceConnectionString] [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceIsForwardMapped] [tinyint] NOT NULL,
	[SourceIsUpdateRequired] [tinyint] NOT NULL,
	[DestinationTypeName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DestinationConectionString] [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DestinationIsForwardMapped] [tinyint] NOT NULL,
	[DestinationIsUpdateRequired] [tinyint] NOT NULL,
	[BaseConfig] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceConfig] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DestinationConfig] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SerializedMapping] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImportType] [int] NOT NULL,
	[LogLevel] [int] NOT NULL,
	[PageSize] [int] NOT NULL,
	[TransactionSize] [int] NOT NULL,
	[IntermediateCommits] [tinyint] NOT NULL,
	[CopyToBase] [tinyint] NOT NULL,
	[MarkedForDelete] [tinyint] NULL,
 CONSTRAINT [pk_OAImportConfigurations] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
