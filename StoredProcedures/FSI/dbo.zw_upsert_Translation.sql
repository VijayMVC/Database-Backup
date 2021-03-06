/****** Object:  StoredProcedure [dbo].[zw_upsert_Translation]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_Translation ( 
@AMERICAN varchar(80)   = NULL , 
@ENGLISH varchar(80)   = NULL , 
@SPANISH varchar(80)   = NULL , 
@DateCreated datetime  = NULL , 
@DateModified datetime  = NULL , 
@Chinese varchar(80)   = NULL , 
@FrenchCanadian varchar(80)   = NULL , 
@Portuguese varchar(80)   = NULL , 
@Australian varchar(80)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Translation'
 
	 UPDATE [Translation] 
	 SET   
		[ENGLISH] = @ENGLISH, 
		[SPANISH] = @SPANISH, 
		[DateCreated] = @DateCreated, 
		[DateModified] = @DateModified, 
		[Chinese] = @Chinese, 
		[FrenchCanadian] = @FrenchCanadian, 
		[Portuguese] = @Portuguese, 
		[Australian] = @Australian, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [AMERICAN] = @AMERICAN
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Translation]( [AMERICAN], [ENGLISH], [SPANISH], [DateCreated], [DateModified], [Chinese], [FrenchCanadian], [Portuguese], [Australian], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @AMERICAN, @ENGLISH, @SPANISH, @DateCreated, @DateModified, @Chinese, @FrenchCanadian, @Portuguese, @Australian, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
