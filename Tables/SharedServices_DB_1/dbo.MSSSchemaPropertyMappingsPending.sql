/****** Object:  Table [dbo].[MSSSchemaPropertyMappingsPending]    Script Date: 5/15/2018 12:05:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSchemaPropertyMappingsPending](
	[PID] [int] NOT NULL,
	[MappingOrder] [int] NOT NULL,
	[CrawledPropertyId] [int] NOT NULL
) ON [PRIMARY]

GO
