/****** Object:  Table [dbo].[Affiliate]    Script Date: 5/15/2018 12:03:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Affiliate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Affiliate]  WITH CHECK ADD  CONSTRAINT [Affiliate_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Affiliate] CHECK CONSTRAINT [Affiliate_Address]
GO
