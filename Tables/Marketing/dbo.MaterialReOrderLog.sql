/****** Object:  Table [dbo].[MaterialReOrderLog]    Script Date: 5/15/2018 12:02:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MaterialReOrderLog](
	[MatId] [int] NOT NULL,
	[MatLotId] [int] NOT NULL,
	[MatRId] [int] NOT NULL,
	[MatRQty] [smallint] NULL,
	[MatRPrice] [float] NULL,
	[MatRDate] [smalldatetime] NULL,
	[MatRPDFFileName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MaterialReOrderLog] PRIMARY KEY CLUSTERED 
(
	[MatRId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_MaterialReOrderLog]    Script Date: 5/15/2018 12:02:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_MaterialReOrderLog] ON [dbo].[MaterialReOrderLog]
(
	[MatId] ASC,
	[MatLotId] ASC,
	[MatRId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
