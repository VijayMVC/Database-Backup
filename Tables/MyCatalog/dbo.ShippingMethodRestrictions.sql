/****** Object:  Table [dbo].[ShippingMethodRestrictions]    Script Date: 5/15/2018 12:03:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ShippingMethodRestrictions](
	[ShippingMethod_Id] [int] NOT NULL,
	[Country_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingMethod_Id] ASC,
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ShippingMethodRestrictions]  WITH CHECK ADD  CONSTRAINT [ShippingMethod_RestrictedCountries_Source] FOREIGN KEY([ShippingMethod_Id])
REFERENCES [dbo].[ShippingMethod] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[ShippingMethodRestrictions] CHECK CONSTRAINT [ShippingMethod_RestrictedCountries_Source]
ALTER TABLE [dbo].[ShippingMethodRestrictions]  WITH CHECK ADD  CONSTRAINT [ShippingMethod_RestrictedCountries_Target] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[ShippingMethodRestrictions] CHECK CONSTRAINT [ShippingMethod_RestrictedCountries_Target]
GO
