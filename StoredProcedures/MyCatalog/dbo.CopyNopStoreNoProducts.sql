/****** Object:  StoredProcedure [dbo].[CopyNopStoreNoProducts]    Script Date: 5/15/2018 12:11:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE PROCEDURE [dbo].[CopyNopStoreNoProducts] 
@OriginalStoreId int,	-- the web number to copy the products from
@PrimaryContact nvarchar(max),	
@ParentWebNumber int,			-- the parent of this new site
@WebNumber int,					-- this new site's web number
@MainPhone nvarchar(50),
@Street1 nvarchar(50),
@Street2 nvarchar(50),
@City nvarchar(50),
@StateProvince nchar(10),
@PostalCode nvarchar(50),
@EMail nvarchar(50)

AS BEGIN


DECLARE @NewStoreId int
DECLARE @NewWebNumber int
DECLARE @NewParentStoreId int		-- the PK for the given @ParentWebNumer
DECLARE @ScriptDate DateTime
DECLARE @NewURL nvarchar(max)		-- calculated URL for a default
DECLARE @NewStoreIdIterator int
DECLARE @CountryId int
DECLARE @StateId int
DECLARE @NewAddressId int
DECLARE @NewStoreAddressDSI nvarchar(max)		-- calculated address line for DSI

SELECT TOP 1 @NewStoreId =  [Id]+1 FROM [dbo].[Store] ORDER BY ID DESC
SET @NewWebNumber = @WebNumber		--29

-- Get the [ParentStoreId] from the given @ParentWebNumber
SELECT @NewParentStoreId = [Id] FROM [dbo].[Store] WHERE [WebNumber] = @ParentWebNumber
SET @NewParentStoreId = ISNULL(@NewParentStoreId, 0)	-- Default to the superstore id

SET @ScriptDate = GETDATE()

CREATE TABLE #IDs
(
	[OriginalId] int NOT NULL,
	[NewId] int NOT NULL,
	[EntityName] nvarchar(100) NOT NULL
)

PRINT @ScriptDate
-- Create the new store for the target 
-- Store
--	Find out what the URL for the new store should look like
SET @NewURL = RTRIM(CAST(@NewWebNumber AS char(10)))
IF (@NewParentStoreId != 0)
BEGIN
	SET @NewStoreIdIterator = 1
	WHILE (EXISTS(SELECT TOP 1 [URL] FROM [dbo].[Store] WHERE [URL] = @NewURL))
	BEGIN
		SET @NewURL = 	RTRIM(CAST(@NewWebNumber AS char(10)))+ '-'+ RTRIM(CAST(@NewStoreIdIterator AS char(10)))
	END
END	

INSERT INTO [dbo].[Store] ([Id],[ParentStoreId],[Name],[ShortDescription],[FullDescription],[AdminComment],[URL],[PictureId],[WebNumber],[BillingAddress_Id],[ShippingAddress_Id])
	SELECT @NewStoreId AS [Id], @NewParentStoreId AS [ParentStoreId],'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) AS [Name],'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) AS [ShortDescription],'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) AS [FullDescription],'New Store' AS [AdminComment], @NewURL AS [URL],[PictureId],@NewWebNumber AS [WebNumber],[BillingAddress_Id],[ShippingAddress_Id]
	FROM [dbo].[Store]
	WHERE Id = @OriginalStoreId

-- Get Products, ProductVariants, ProductAttributes, and Categories with a mapping


--ShippingMethod
DECLARE @OriginalShippingMethodId int
DECLARE @NewShippingMethodId int
DECLARE cur_originalShippingMethod CURSOR FOR
SELECT Id
	FROM [dbo].[ShippingMethod]
	WHERE [StoreId] = @OriginalStoreId
	ORDER BY [Id]
OPEN cur_originalShippingMethod
FETCH NEXT FROM cur_originalShippingMethod INTO @OriginalShippingMethodId
WHILE @@FETCH_STATUS = 0
BEGIN	
     PRINT 'moving ShippingMethodId '+ cast(@OriginalShippingMethodId as nvarchar(10))
     INSERT INTO [ShippingMethod] ([Name],[Description],[DisplayOrder],[StoreId])
			SELECT [Name],[Description],[DisplayOrder],@NewStoreId AS [StoreId]
			FROM [dbo].[ShippingMethod]
			WHERE Id = @OriginalShippingMethodId
 
     --fetch next identifier
     FETCH NEXT FROM cur_originalShippingMethod INTO @OriginalShippingMethodId
END
CLOSE cur_originalShippingMethod
DEALLOCATE cur_originalShippingMethod

--Topic
DECLARE @OriginalTopicId int
DECLARE @NewTopicId int
DECLARE cur_originalTopic CURSOR FOR
SELECT Id
	FROM [dbo].[Topic]
	WHERE [StoreId] = @OriginalStoreId
	ORDER BY [Id]
OPEN cur_originalTopic
FETCH NEXT FROM cur_originalTopic INTO @OriginalTopicId
WHILE @@FETCH_STATUS = 0
BEGIN	
     PRINT 'moving TopicId '+ cast(@OriginalTopicId as nvarchar(10))
     INSERT INTO [Topic] ([SystemName],[IncludeInSitemap],[IsPasswordProtected],[Password],[Title],[Body],[MetaKeywords],[MetaDescription],[MetaTitle],[StoreId])
			SELECT [SystemName],[IncludeInSitemap],[IsPasswordProtected],[Password],[Title],[Body],[MetaKeywords],[MetaDescription],[MetaTitle],@NewStoreId AS [StoreId]
			FROM [dbo].[Topic]
			WHERE Id = @OriginalTopicId
 
     --fetch next identifier
     FETCH NEXT FROM cur_originalTopic INTO @OriginalTopicId
END
CLOSE cur_originalTopic
DEALLOCATE cur_originalTopic
 
--EmailAccount
DECLARE @OriginalEmailAccountId int
DECLARE @NewEmailAccountId int
DECLARE cur_originalEmailAccount CURSOR FOR
SELECT Id
	FROM [dbo].[EmailAccount]
	WHERE [StoreId] = @OriginalStoreId
	ORDER BY [Id]
OPEN cur_originalEmailAccount
FETCH NEXT FROM cur_originalEmailAccount INTO @OriginalEmailAccountId
WHILE @@FETCH_STATUS = 0
BEGIN	
     PRINT 'moving EmailAccountId '+ cast(@OriginalEmailAccountId as nvarchar(10))
     INSERT INTO [EmailAccount] ([Email],[DisplayName],[Host],[Port],[Username],[Password],[EnableSsl],[UseDefaultCredentials],[StoreId])
			SELECT [Email],[DisplayName],[Host],[Port],[Username],[Password],[EnableSsl],[UseDefaultCredentials],@NewStoreId AS [StoreId]
			FROM [dbo].[EmailAccount]
			WHERE Id = @OriginalEmailAccountId
 
     --fetch next identifier
     FETCH NEXT FROM cur_originalEmailAccount INTO @OriginalEmailAccountId
END
CLOSE cur_originalEmailAccount
DEALLOCATE cur_originalEmailAccount
-- Insert the EmailAccount for the CenterAdministrator
IF (@EMail IS NOT NULL)
INSERT INTO [EmailAccount] ([Email],[DisplayName],[Host],[Port],[Username],[Password],[EnableSsl],[UseDefaultCredentials],[StoreId])
VALUES
(@EMail, @PrimaryContact, CASE 
		WHEN (charindex('@fastsigns.com',@EMail) > 0) 
		THEN 'outlook.fastsigns.com' 
		ELSE RTRIM('smtp.'+SUBSTRING(@EMail, charindex('@',@EMail)+1,100) )
	END , 25, SUBSTRING(@EMail, 0, charindex('@',@EMail)), '123', 
	CASE
		WHEN (charindex('@fastsigns.com',@EMail) > 0)
		THEN 1
		ELSE 0
	END, 0, @NewStoreId );

--Customer
IF NOT (EXISTS(SELECT [Id] FROM [dbo].[Customer] WHERE [Email] = @EMail))
BEGIN
	INSERT INTO [dbo].[Customer] 
	([CustomerGuid],[StoreId],[Username],[Email],[Password],[PasswordFormatId],[TaxDisplayTypeId],[IsTaxExempt],[VatNumberStatusId],[UseRewardPointsDuringCheckout],[Active],[Deleted],[IsSystemAccount],[CreatedOnUtc],[LastActivityDateUtc] )
	VALUES
	(NEWID(),@NewStoreId, @EMail, @EMail, '123',0,0,0,0,0,0,0,0,@ScriptDate, @ScriptDate)
END
 
--MessageTemplate
DECLARE @OriginalMessageTemplateId int
DECLARE @NewMessageTemplateId int
DECLARE cur_originalMessageTemplate CURSOR FOR
SELECT Id
	FROM [dbo].[MessageTemplate]
	WHERE [StoreId] = @OriginalStoreId
	ORDER BY [Id]
OPEN cur_originalMessageTemplate
FETCH NEXT FROM cur_originalMessageTemplate INTO @OriginalMessageTemplateId
WHILE @@FETCH_STATUS = 0
BEGIN	
     PRINT 'moving MessageTemplateId '+ cast(@OriginalMessageTemplateId as nvarchar(10))
     INSERT INTO [MessageTemplate] ([Name],[BccEmailAddresses],[Subject],[Body],[IsActive],[EmailAccountId],[StoreId])
			SELECT [Name],[BccEmailAddresses],[Subject],[Body],[IsActive],[EmailAccountId],@NewStoreId AS [StoreId]
			FROM [dbo].[MessageTemplate]
			WHERE Id = @OriginalMessageTemplateId
 
     SET @NewMessageTemplateId = @@IDENTITY
 
     INSERT INTO #IDs  ([OriginalId], [NewId], [EntityName])
     VALUES (@OriginalMessageTemplateId, @NewMessageTemplateId, N'MessageTemplate')
 
     --fetch next identifier
     FETCH NEXT FROM cur_originalMessageTemplate INTO @OriginalMessageTemplateId
END
CLOSE cur_originalMessageTemplate
DEALLOCATE cur_originalMessageTemplate

--Settings
DECLARE @OriginalSettingId int
DECLARE cuSettings CURSOR FOR
SELECT Id
FROM [dbo].[Setting] 
WHERE [StoreId] = @OriginalStoreId

OPEN cuSettings
FETCH NEXT FROM cuSettings INTO @OriginalSettingId
WHILE @@FETCH_STATUS = 0
BEGIN	
	INSERT INTO [Setting] ([Name], [Value], [StoreId])
		SELECT SUBSTRING ( [Name],       0,       charindex('.'+RTRIM(CAST(@OriginalStoreId as char(10))), [Name]) +1         )+ RTRIM(CAST(@NewStoreId as char(10))) AS [Name], [Value], @NewStoreId AS [StoreId]
		FROM [dbo].[Setting]
		WHERE Id = @OriginalSettingId

	FETCH NEXT FROM cuSettings INTO @OriginalSettingId
END
CLOSE cuSettings
DEALLOCATE cuSettings

--Update the store name and theme settings
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'seosettings.defaulttitle.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	('FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) ,'seosettings.defaulttitle.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = 'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10)))
	WHERE 
		[Name] = 'seosettings.defaulttitle.'+RTRIM(CAST(@NewStoreId as char(10))) 
		AND [StoreId] = @NewStoreId
END
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.storename.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	('FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) ,'storeinformationsettings.storename.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = 'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10)))
	WHERE
		[Name] = 'storeinformationsettings.storename.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.storeurl.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	('http://'+@NewURL+'.buystage.fastsigns.com' ,'storeinformationsettings.storeurl.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = 'http://'+@NewURL+'.buystage.fastsigns.com' 
	WHERE 
		[Name] = 'storeinformationsettings.storeurl.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.defaultstoretheme.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	('NewDesign' ,'storeinformationsettings.defaultstoretheme.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = 'NewDesign' 
	WHERE 
		[Name] = 'storeinformationsettings.defaultstoretheme.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END

select @CountryId = id from country where twoletterisocode = 'US'
select @StateId = id from stateprovince where abbreviation = @StateProvince

INSERT INTO [dbo].[Address]
           ([FirstName]           ,[Email]           ,[Company]           ,[CountryId]           ,[StateProvinceId]
           ,[City]           ,[Address1]           ,[Address2]           ,[ZipPostalCode]           ,[PhoneNumber]
           ,[CreatedOnUtc]           ,[Store_Id])
     VALUES
           (@PrimaryContact
           ,@EMail
           ,'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10)))
           ,@CountryId
           ,@StateId
           ,@City
           ,@Street1
           ,@Street2
           ,@PostalCode
           ,@MainPhone
           ,GETDATE()
           ,@NewStoreId)

SET @NewAddressId = @@IDENTITY

IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'taxsettings.defaulttaxaddressid.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	(RTRIM(CAST(@NewAddressId as char(10))) ,'taxsettings.defaulttaxaddressid.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = RTRIM(CAST(@NewAddressId as char(10))) 
	WHERE 
		[Name] = 'taxsettings.defaulttaxaddressid.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END

INSERT INTO [dbo].[Address]
([CountryId]           ,[StateProvinceId], [ZipPostalCode], [CreatedOnUtc]           ,[Store_Id])
VALUES
(@CountryId           ,@StateId           ,@PostalCode           ,GETDATE()           ,@NewStoreId)
SET @NewAddressId = @@IDENTITY

--'shippingsettings.shippingoriginaddressid'
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'shippingsettings.shippingoriginaddressid.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	(RTRIM(CAST(@NewAddressId as char(10))) ,'shippingsettings.shippingoriginaddressid.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = RTRIM(CAST(@NewAddressId as char(10))) 
	WHERE 
		[Name] = 'shippingsettings.shippingoriginaddressid.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END

--'storeinformationsettings.storedisplayname.'
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.storedisplayname.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	('FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) ,'storeinformationsettings.storedisplayname.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = 'FASTSIGNS® '+RTRIM(CAST(@NewWebNumber AS char(10))) 
	WHERE 
		[Name] = 'storeinformationsettings.storedisplayname.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END

--'storeinformationsettings.storedisplayaddress.'
SET @NewStoreAddressDSI = RTRIM(ISNULL(@Street1,' '))+' '+RTRIM(ISNULL(@City,' '))+','+RTRIM(ISNULL(@StateProvince,' '))+' '+RTRIM(ISNULL(@PostalCode,' '))
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.storedisplayaddress.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	(@NewStoreAddressDSI ,'storeinformationsettings.storedisplayaddress.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = @NewStoreAddressDSI 
	WHERE 
		[Name] = 'storeinformationsettings.storedisplayaddress.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END
--'storeinformationsettings.storedisplayphonenumer.'
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.storedisplayphonenumer.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	(ISNULL(@MainPhone,' ') ,'storeinformationsettings.storedisplayphonenumer.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = ISNULL(@MainPhone,' ')
	WHERE 
		[Name] = 'storeinformationsettings.storedisplayphonenumer.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END
--'storeinformationsettings.showstoredisplay.'
IF NOT EXISTS(SELECT Id FROM Setting WHERE Name = 'storeinformationsettings.showstoredisplay.'+RTRIM(CAST(@NewStoreId as char(10))) AND [StoreId] = @NewStoreId  )
BEGIN
	INSERT INTO Setting ([Value],[Name],[StoreId])
	VALUES
	('True' ,'storeinformationsettings.showstoredisplay.'+RTRIM(CAST(@NewStoreId as char(10))), @NewStoreId)
END
ELSE
BEGIN
	UPDATE Setting SET [Value] = 'True'
	WHERE 
		[Name] = 'storeinformationsettings.showstoredisplay.'+RTRIM(CAST(@NewStoreId as char(10)))
		AND [StoreId] = @NewStoreId
END

END



GO
