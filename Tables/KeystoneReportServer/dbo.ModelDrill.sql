/****** Object:  Table [dbo].[ModelDrill]    Script Date: 5/15/2018 12:02:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ModelDrill](
	[ModelDrillID] [uniqueidentifier] NOT NULL,
	[ModelID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[ModelItemID] [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Type] [tinyint] NOT NULL,
 CONSTRAINT [PK_ModelDrill] PRIMARY KEY NONCLUSTERED 
(
	[ModelDrillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ModelDrillModelID]    Script Date: 5/15/2018 12:02:21 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_ModelDrillModelID] ON [dbo].[ModelDrill]
(
	[ModelID] ASC,
	[ReportID] ASC,
	[ModelDrillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[ModelDrill]  WITH NOCHECK ADD  CONSTRAINT [FK_ModelDrillModel] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
ALTER TABLE [dbo].[ModelDrill] CHECK CONSTRAINT [FK_ModelDrillModel]
ALTER TABLE [dbo].[ModelDrill]  WITH NOCHECK ADD  CONSTRAINT [FK_ModelDrillReport] FOREIGN KEY([ReportID])
REFERENCES [dbo].[Catalog] ([ItemID])
ALTER TABLE [dbo].[ModelDrill] CHECK CONSTRAINT [FK_ModelDrillReport]
GO
