/****** Object:  Table [dbo].[SubsidyLog]    Script Date: 5/15/2018 12:02:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SubsidyLog](
	[SubLStoreId] [int] NOT NULL,
	[SubLYear] [smallint] NOT NULL,
	[SubLId] [int] NOT NULL,
	[SubLType] [tinyint] NULL,
	[SubLOrdHId] [int] NULL,
	[SubLOrdDId] [int] NULL,
	[SubLPrdId] [int] NULL,
	[SubLHId] [int] NULL,
	[SubLHType] [tinyint] NULL,
	[SubLDType] [tinyint] NULL,
	[SubLDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubLAmount] [real] NULL,
	[SubLDate] [datetime] NULL,
	[InvoiceAmount] [real] NULL,
	[SubsidyQualifierID] [int] NULL,
	[UsageDateFrom] [datetime] NULL,
	[UsageDateTo] [datetime] NULL,
 CONSTRAINT [PK_SubsidyLog] PRIMARY KEY CLUSTERED 
(
	[SubLYear] ASC,
	[SubLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_SubsidyLog]    Script Date: 5/15/2018 12:02:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubsidyLog] ON [dbo].[SubsidyLog]
(
	[SubLStoreId] ASC,
	[SubLYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_SubsidyLog_Order]    Script Date: 5/15/2018 12:02:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubsidyLog_Order] ON [dbo].[SubsidyLog]
(
	[SubLOrdHId] ASC,
	[SubLOrdDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
