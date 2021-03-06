/****** Object:  Table [dbo].[AutoInc]    Script Date: 5/15/2018 12:02:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AutoInc](
	[TableName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FieldName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartId] [int] NULL,
	[EndId] [int] NULL,
	[StepValue] [int] NULL,
	[CurrentId] [int] NULL,
 CONSTRAINT [PK_AutoInc] PRIMARY KEY CLUSTERED 
(
	[TableName] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_AutoInc]    Script Date: 5/15/2018 12:02:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_AutoInc] ON [dbo].[AutoInc]
(
	[TableName] ASC,
	[FieldName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
