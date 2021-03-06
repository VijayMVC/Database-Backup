/****** Object:  Table [dbo].[MSSSchemaPropertyMappings]    Script Date: 5/15/2018 12:09:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSchemaPropertyMappings](
	[PID] [int] NOT NULL,
	[MappingOrder] [int] NOT NULL,
	[CrawledPropertyId] [int] NOT NULL,
 CONSTRAINT [PK_MSSSchemaPropertyMappings] PRIMARY KEY CLUSTERED 
(
	[PID] ASC,
	[MappingOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_MSSSchemaPropertyMappings]    Script Date: 5/15/2018 12:09:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MSSSchemaPropertyMappings] ON [dbo].[MSSSchemaPropertyMappings]
(
	[CrawledPropertyId] ASC,
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSSchemaPropertyMappings]  WITH CHECK ADD  CONSTRAINT [FK_MSSSchemaPropertyMappings_CrawledPropertyID] FOREIGN KEY([CrawledPropertyId])
REFERENCES [dbo].[MSSCrawledProperties] ([CrawledPropertyId])
ALTER TABLE [dbo].[MSSSchemaPropertyMappings] CHECK CONSTRAINT [FK_MSSSchemaPropertyMappings_CrawledPropertyID]
ALTER TABLE [dbo].[MSSSchemaPropertyMappings]  WITH CHECK ADD  CONSTRAINT [FK_MSSSchemaPropertyMappings_PID] FOREIGN KEY([PID])
REFERENCES [dbo].[MSSManagedProperties] ([PID])
ALTER TABLE [dbo].[MSSSchemaPropertyMappings] CHECK CONSTRAINT [FK_MSSSchemaPropertyMappings_PID]
GO
