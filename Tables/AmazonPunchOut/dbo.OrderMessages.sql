/****** Object:  Table [dbo].[OrderMessages]    Script Date: 5/15/2018 11:58:43 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PayLoadId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[timestamp] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OperationAllowed] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[header_FromDomain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_FormIdentity] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_ToDomain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_ToIdentity] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_SenderDomain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_SenderIdentity] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_SenderSharedSecret] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[header_UserAgent] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BuyerCookie] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.OrderMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [BuyerCookie]    Script Date: 5/15/2018 11:58:43 AM ******/
CREATE NONCLUSTERED INDEX [BuyerCookie] ON [dbo].[OrderMessages]
(
	[BuyerCookie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
