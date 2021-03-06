/****** Object:  Table [dbo].[Store]    Script Date: 5/15/2018 12:03:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Store](
	[Id] [int] NOT NULL,
	[ParentStoreId] [int] NOT NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortDescription] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullDescription] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AdminComment] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PictureId] [int] NULL,
	[WebNumber] [int] NOT NULL,
	[BillingAddress_Id] [int] NULL,
	[ShippingAddress_Id] [int] NULL,
	[Public] [bit] NOT NULL,
 CONSTRAINT [PK__Store__1CBC4616] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Public]  DEFAULT ((1)) FOR [Public]
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [Store_BillingAddress] FOREIGN KEY([BillingAddress_Id])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [Store_BillingAddress]
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [Store_ShippingAddress] FOREIGN KEY([ShippingAddress_Id])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [Store_ShippingAddress]
GO
