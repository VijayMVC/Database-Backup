/****** Object:  Table [dbo].[MessageTemplate]    Script Date: 5/15/2018 12:03:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MessageTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BccEmailAddresses] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Body] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL,
	[EmailAccountId] [int] NOT NULL,
	[StoreId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_MessageTemplate_StoreId]    Script Date: 5/15/2018 12:03:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_MessageTemplate_StoreId] ON [dbo].[MessageTemplate]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[MessageTemplate]  WITH CHECK ADD  CONSTRAINT [MessageTemplate_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([Id])
ALTER TABLE [dbo].[MessageTemplate] CHECK CONSTRAINT [MessageTemplate_Store]
GO
