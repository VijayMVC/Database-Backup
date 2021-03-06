/****** Object:  Table [dbo].[SpecificationAttributeOption]    Script Date: 5/15/2018 12:08:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SpecificationAttributeOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecificationAttributeId] [int] NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[SpecificationAttributeOption]  WITH CHECK ADD  CONSTRAINT [SpecificationAttributeOption_SpecificationAttribute] FOREIGN KEY([SpecificationAttributeId])
REFERENCES [dbo].[SpecificationAttribute] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[SpecificationAttributeOption] CHECK CONSTRAINT [SpecificationAttributeOption_SpecificationAttribute]
GO
