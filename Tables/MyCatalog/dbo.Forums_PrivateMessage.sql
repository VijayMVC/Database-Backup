/****** Object:  Table [dbo].[Forums_PrivateMessage]    Script Date: 5/15/2018 12:03:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Forums_PrivateMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromCustomerId] [int] NOT NULL,
	[ToCustomerId] [int] NOT NULL,
	[Subject] [nvarchar](450) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Text] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsDeletedByAuthor] [bit] NOT NULL,
	[IsDeletedByRecipient] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Forums_PrivateMessage]  WITH CHECK ADD  CONSTRAINT [PrivateMessage_FromCustomer] FOREIGN KEY([FromCustomerId])
REFERENCES [dbo].[Customer] ([Id])
ALTER TABLE [dbo].[Forums_PrivateMessage] CHECK CONSTRAINT [PrivateMessage_FromCustomer]
ALTER TABLE [dbo].[Forums_PrivateMessage]  WITH CHECK ADD  CONSTRAINT [PrivateMessage_ToCustomer] FOREIGN KEY([ToCustomerId])
REFERENCES [dbo].[Customer] ([Id])
ALTER TABLE [dbo].[Forums_PrivateMessage] CHECK CONSTRAINT [PrivateMessage_ToCustomer]
GO
