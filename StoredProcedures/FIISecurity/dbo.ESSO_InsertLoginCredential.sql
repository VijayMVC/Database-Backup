/****** Object:  StoredProcedure [dbo].[ESSO_InsertLoginCredential]    Script Date: 5/15/2018 12:09:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


-- =============================================
-- Author:		<Shreyas Patel>
-- Create date: <11/26/2012>
-- Description:	<This store procedure is used to insert ESSO Login credentials for users in FIIUsers table
-- =============================================
CREATE PROCEDURE [dbo].[ESSO_InsertLoginCredential] 
	(
	 @FIIUserID int,
	 @ExternalAppId int,
	 @ExternalAppLoginID varchar(100),
	 @ExternalAppPassword varchar(MAX),
	 @PasswordEncryptionKey varchar(MAX),
	 @Active bit = 1
	 )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
    
    DECLARE @ParametersOk bit;
	SET @ParametersOk = 1;

	SET @ExternalAppLoginID = LTRIM(RTRIM(@ExternalAppLoginID));
	SET @ExternalAppPassword = LTRIM(RTRIM(@ExternalAppPassword));
	SET @PasswordEncryptionKey = LTRIM(RTRIM(@PasswordEncryptionKey));
	
    IF ISNULL(@FIIUserID, 0) = 0
		BEGIN
			SET @ParametersOk = 0;
		END

	IF ISNULL(@ExternalAppId, 0) = 0
		BEGIN
			SET @ParametersOk = 0;
		END
	
	IF ISNULL(@ExternalAppLoginID, '') = ''
		BEGIN
			SET @ParametersOk = 0;
		END
	
	IF ISNULL(@ExternalAppPassword, '') = ''
		BEGIN
			SET @ParametersOk = 0;
		END
	
	IF (@ParametersOk = 0)
		BEGIN
			RETURN (90)
		END
    
	INSERT INTO [FIISecurity].[dbo].[FII_ESSO_ExternalApplicationUsers]
           ([FIIUserID]
           ,[ExternalAppId]
           ,[ExternalAppLoginID]
           ,[ExternalAppPassword]
           ,[PasswordEncryptionKey]
           ,[Active]
           ,[CreatedDate]
           ,[ModifiedDate]
           )
     VALUES(@FIIUserID
           ,@ExternalAppId
           ,@ExternalAppLoginID
           ,@ExternalAppPassword
           ,@PasswordEncryptionKey
           ,@Active
           ,GETDATE()
           ,GETDATE()
           )
END
	
	



GO
