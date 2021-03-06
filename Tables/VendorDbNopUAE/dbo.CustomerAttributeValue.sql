/****** Object:  Table [dbo].[CustomerAttributeValue]    Script Date: 5/15/2018 12:08:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CustomerAttributeValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerAttributeId] [int] NOT NULL,
	[Name] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsPreSelected] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[CustomerAttributeValue]  WITH CHECK ADD  CONSTRAINT [CustomerAttributeValue_CustomerAttribute] FOREIGN KEY([CustomerAttributeId])
REFERENCES [dbo].[CustomerAttribute] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[CustomerAttributeValue] CHECK CONSTRAINT [CustomerAttributeValue_CustomerAttribute]
GO
