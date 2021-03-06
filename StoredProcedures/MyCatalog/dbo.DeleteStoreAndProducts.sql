/****** Object:  StoredProcedure [dbo].[DeleteStoreAndProducts]    Script Date: 5/15/2018 12:11:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:		Steven Scott
-- Create date: 4/4/2018
-- Description:	Delete a store and all its products, orders, customers, addresses, email accounts, etc.
-- =============================================

CREATE PROCEDURE [dbo].[DeleteStoreAndProducts] 

	@StoreId int -- StoreId of the store to be deleted from dbo.Store table

AS
BEGIN

	SET NOCOUNT ON;

	  DELETE FROM dbo.QueuedEmail 
	  FROM dbo.QueuedEmail INNER JOIN dbo.EmailAccount ON dbo.QueuedEmail.EmailAccountId = dbo.EmailAccount.Id
      WHERE  dbo.EmailAccount.StoreId = @StoreId

	  DELETE FROM dbo.EmailAccount
	  WHERE dbo.EmailAccount.StoreId = @StoreId

	  DELETE FROM dbo.Setting
	  WHERE dbo.Setting.StoreId = @StoreId

	  DELETE FROM dbo.Setting_Bad
	  WHERE dbo.Setting_Bad.StoreId = @StoreId

	  DELETE FROM dbo.Setting_edit
	  WHERE dbo.Setting_edit.StoreId = @StoreId

      DELETE FROM dbo.TaxQuote
      WHERE dbo.TaxQuote.StoreId = @StoreId

	  DELETE FROM dbo.Topic
      WHERE dbo.Topic.StoreId = @StoreId

	  DELETE FROM dbo.News
      WHERE dbo.News.StoreId = @StoreId

	  DELETE FROM dbo.MessageTemplate
      WHERE dbo.MessageTemplate.StoreId = @StoreId

	  DELETE FROM dbo.GiftCard
      WHERE dbo.GiftCard.StoreId = @StoreId

	  DELETE FROM dbo.ShippingMethod
      WHERE dbo.ShippingMethod.StoreId = @StoreId

	  DELETE FROM dbo.ProductAttribute
      WHERE dbo.ProductAttribute.StoreId = @StoreId

	  DELETE FROM dbo.CheckoutAttributeValue
      FROM dbo.CheckoutAttributeValue INNER JOIN dbo.CheckoutAttribute ON dbo.CheckoutAttributeValue.CheckoutAttributeId = dbo.CheckoutAttribute.Id
	  WHERE dbo.CheckoutAttribute.StoreId = @StoreId

	  DELETE FROM dbo.CheckoutAttribute
      WHERE dbo.CheckoutAttribute.StoreId = @StoreId

	  DELETE FROM dbo.product_myowntabletoworkwith
      WHERE dbo.product_myowntabletoworkwith.StoreId = @StoreId

	  DELETE FROM dbo.product_BackupB4BlurbAddFromJosh
      WHERE dbo.product_BackupB4BlurbAddFromJosh.StoreId = @StoreId

	  DELETE FROM dbo.Picture
	  FROM dbo.Picture 
	  INNER JOIN dbo.Product_Picture_Mapping ON dbo.Product_Picture_Mapping.PictureId = dbo.Picture.Id
	  INNER JOIN dbo.Product ON dbo.Product_Picture_Mapping.ProductId = dbo.Product.Id
	  WHERE dbo.Product.StoreId = @StoreId

	  DELETE FROM dbo.Product
      WHERE dbo.Product.StoreId = @StoreId

	  DELETE FROM dbo.Category
      WHERE dbo.Category.StoreId = @StoreId

	  DELETE FROM dbo.Address
      WHERE dbo.Address.Store_Id = @StoreId

      DELETE FROM dbo.CustomerAddresses
      FROM dbo.CustomerAddresses INNER JOIN dbo.Customer ON dbo.CustomerAddresses.Customer_Id = dbo.customer.Id
	  WHERE dbo.Customer.StoreId = @StoreId

	  DELETE FROM dbo.CustomerAttribute
      FROM dbo.CustomerAttribute INNER JOIN dbo.Customer ON dbo.CustomerAttribute.CustomerId = dbo.Customer.Id
	  WHERE dbo.Customer.StoreId = @StoreId

	  DELETE FROM dbo.Customer
      WHERE dbo.Customer.StoreId = @StoreId

	  DELETE FROM [dbo].[Order]
      WHERE [dbo].[Order].[StoreId] = @StoreId

	  DELETE FROM dbo.Picture
      FROM dbo.Picture INNER JOIN dbo.Store ON dbo.Picture.Id = dbo.Store.PictureId
	  WHERE dbo.Store.Id = @StoreId

	  DELETE FROM dbo.Store
      WHERE dbo.Store.Id = @StoreId



	
END


GO
