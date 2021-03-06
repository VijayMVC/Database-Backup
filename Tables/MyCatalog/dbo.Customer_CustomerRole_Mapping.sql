/****** Object:  Table [dbo].[Customer_CustomerRole_Mapping]    Script Date: 5/15/2018 12:03:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Customer_CustomerRole_Mapping](
	[CustomerRole_Id] [int] NOT NULL,
	[Customer_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerRole_Id] ASC,
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [_dta_index_Customer_CustomerRole_Mapping_50_501576825__K2]    Script Date: 5/15/2018 12:03:23 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Customer_CustomerRole_Mapping_50_501576825__K2] ON [dbo].[Customer_CustomerRole_Mapping]
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Customer_CustomerRole_Mapping]  WITH CHECK ADD  CONSTRAINT [CustomerRole_Customers_Source] FOREIGN KEY([CustomerRole_Id])
REFERENCES [dbo].[CustomerRole] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Customer_CustomerRole_Mapping] CHECK CONSTRAINT [CustomerRole_Customers_Source]
ALTER TABLE [dbo].[Customer_CustomerRole_Mapping]  WITH CHECK ADD  CONSTRAINT [CustomerRole_Customers_Target] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Customer_CustomerRole_Mapping] CHECK CONSTRAINT [CustomerRole_Customers_Target]
GO
