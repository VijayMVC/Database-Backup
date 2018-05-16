/****** Object:  Table [dbo].[MSSSessionDocProps]    Script Date: 5/15/2018 12:05:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSessionDocProps](
	[CatalogId] [smallint] NOT NULL,
	[DocId] [int] NOT NULL,
	[Pid] [int] NOT NULL,
	[RowId] [smallint] NOT NULL,
	[llVal] [bigint] NULL,
	[strVal] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[binVal] [image] NULL,
	[fltVal] [float] NULL,
	[RecordExists] [bit] NOT NULL,
	[llValChanged] [bit] NOT NULL,
	[strValChanged] [bit] NOT NULL,
	[fltValChanged] [bit] NOT NULL,
	[binValChanged] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_MSSSessionDocProps]    Script Date: 5/15/2018 12:05:28 PM ******/
CREATE CLUSTERED INDEX [IX_MSSSessionDocProps] ON [dbo].[MSSSessionDocProps]
(
	[DocId] ASC,
	[Pid] ASC,
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSSessionDocProps] ADD  DEFAULT ((0)) FOR [RecordExists]
ALTER TABLE [dbo].[MSSSessionDocProps] ADD  DEFAULT ((0)) FOR [llValChanged]
ALTER TABLE [dbo].[MSSSessionDocProps] ADD  DEFAULT ((0)) FOR [strValChanged]
ALTER TABLE [dbo].[MSSSessionDocProps] ADD  DEFAULT ((0)) FOR [fltValChanged]
ALTER TABLE [dbo].[MSSSessionDocProps] ADD  DEFAULT ((0)) FOR [binValChanged]
GO
