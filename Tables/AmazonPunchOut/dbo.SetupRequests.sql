/****** Object:  Table [dbo].[SetupRequests]    Script Date: 5/15/2018 11:58:44 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SetupRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[header_FromDomain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_FormIdentity] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_ToDomain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_ToIdentity] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_SenderDomain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_SenderIdentity] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_SenderSharedSecret] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_UserAgent] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lang] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PayloadID] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Timestamp] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BuyerCookie] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact_EmailAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact_EmailAddressName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact_Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact_NameLang] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact_Role] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.SetupRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
