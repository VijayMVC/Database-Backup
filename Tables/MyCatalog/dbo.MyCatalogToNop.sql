/****** Object:  Table [dbo].[MyCatalogToNop]    Script Date: 5/15/2018 12:03:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MyCatalogToNop](
	[WebNumber] [int] NULL,
	[Company_no] [int] NULL,
	[CompanyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[MyCatalogToNop] ADD  CONSTRAINT [DF_MyCatalogToNop_Company_no]  DEFAULT ((0)) FOR [Company_no]
GO
