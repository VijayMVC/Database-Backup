/****** Object:  Table [dbo].[IOTemplate]    Script Date: 5/15/2018 12:06:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[IOTemplate](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[TemplateType] [int] NULL,
	[TemplateName] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Template] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CategoryID] [int] NULL,
	[TextFormat] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IOTemplate_PK]    Script Date: 5/15/2018 12:06:47 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IOTemplate_PK] ON [dbo].[IOTemplate]
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
