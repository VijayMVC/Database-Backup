/****** Object:  Table [Store].[CountryRegion]    Script Date: 5/15/2018 11:59:43 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Store].[CountryRegion](
	[CountryKey] [int] NOT NULL,
	[RegionKey] [int] NOT NULL,
 CONSTRAINT [PK_CountryRegion] PRIMARY KEY CLUSTERED 
(
	[CountryKey] ASC,
	[RegionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Store].[CountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_CountryRegion_CountryDim] FOREIGN KEY([CountryKey])
REFERENCES [Store].[CountryDim] ([CountryKey])
ALTER TABLE [Store].[CountryRegion] CHECK CONSTRAINT [FK_CountryRegion_CountryDim]
ALTER TABLE [Store].[CountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_CountryRegion_RegionDim] FOREIGN KEY([RegionKey])
REFERENCES [Store].[RegionDim] ([RegionKey])
ALTER TABLE [Store].[CountryRegion] CHECK CONSTRAINT [FK_CountryRegion_RegionDim]
GO
