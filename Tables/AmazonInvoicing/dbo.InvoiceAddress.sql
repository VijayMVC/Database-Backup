/****** Object:  Table [dbo].[InvoiceAddress]    Script Date: 5/15/2018 11:58:41 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[InvoiceAddress](
	[OrderId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Attn] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Street] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.InvoiceAddress] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
