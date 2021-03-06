/****** Object:  Table [dbo].[BuyerInfo]    Script Date: 5/15/2018 11:58:41 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BuyerInfo](
	[Company] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EntityName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceEmailAddress] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RegionId] [int] NOT NULL,
 CONSTRAINT [PK_BuyerInfo] PRIMARY KEY CLUSTERED 
(
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BuyerInfo] ADD  CONSTRAINT [DF_BuyerInfo_RegionId]  DEFAULT ((0)) FOR [RegionId]
ALTER TABLE [dbo].[BuyerInfo]  WITH CHECK ADD  CONSTRAINT [FK_BuyerInfo_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
ALTER TABLE [dbo].[BuyerInfo] CHECK CONSTRAINT [FK_BuyerInfo_Regions]
GO
