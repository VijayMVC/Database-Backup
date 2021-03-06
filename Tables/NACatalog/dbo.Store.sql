/****** Object:  Table [dbo].[Store]    Script Date: 5/15/2018 12:04:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Store](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Url] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SslEnabled] [bit] NOT NULL,
	[SecureUrl] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hosts] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayOrder] [int] NOT NULL,
	[CompanyName] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyAddress] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyPhoneNumber] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyVat] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
