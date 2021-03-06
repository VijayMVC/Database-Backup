/****** Object:  StoredProcedure [dbo].[proc_MSS_UpdateLocationConfiguration]    Script Date: 5/15/2018 12:11:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_UpdateLocationConfiguration(
     @InternalName nvarchar(60),
     @DisplayName nvarchar(60),
     @AdminDescription nvarchar(256),
     @LocationType tinyint,
     @Author nvarchar(60),
     @Version nvarchar(50),
     @IsDeletable bit,
     @IsPrefixPattern bit,
     @QueryReformatPattern ntext,
     @PropertySchema ntext,
     @QueryRestriction nvarchar(512),
     @KindsOfResults ntext,
     @Languages ntext,
     @IsRestricted bit,
     @AllowedSiteCollectionGuids ntext,
     @Type tinyint,
     @Data ntext,
     @ConnectionUrlTemplate nvarchar(2048),
     @MoreUrlTemplate nvarchar(2048),
     @CreationDate datetime OUTPUT,
     @LastModifiedDate datetime OUTPUT,
     @LocationId int     
)
 AS

SET NOCOUNT ON

DECLARE @LastError int
DECLARE @IsLongQueryReformatPattern bit
DECLARE @ConnectionUrlType tinyint
DECLARE @MoreUrlType tinyint

DECLARE @ModificationDate datetime

SET @ConnectionUrlType = 0
SET @MoreUrlType = 1

SET @ModificationDate = GETUTCDATE()

SET @LastModifiedDate = @ModificationDate
SELECT @CreationDate = CreationDate
FROM dbo.MSSLocations
WHERE Id = @LocationId

if (datalength(@QueryReformatPattern) > col_length('dbo.MSSLocations', 'QueryReformatPatternl')) set @IsLongQueryReformatPattern = 1 else set @IsLongQueryReformatPattern = 0

BEGIN TRAN

   UPDATE  dbo.MSSLocations
      SET
--         InternalName = @InternalName,
         DisplayName = @DisplayName,
         AdminDescription = @AdminDescription,
         LocationType = @LocationType,        
         Author = @Author,
         Version = @Version,
         IsDeletable = @IsDeletable,
         IsPrefixPattern = @IsPrefixPattern,
         QueryReformatPattern = case when (@IsLongQueryReformatPattern = 0) then  @QueryReformatPattern else null end,
         QueryReformatPatternBig = case when (@IsLongQueryReformatPattern = 1) then  @QueryReformatPattern else null end,
         PropertySchema = @PropertySchema,
         QueryRestriction = @QueryRestriction, 
         KindsOfResults = @KindsOfResults,
         Languages = @Languages,
         IsRestricted = @IsRestricted,
         AllowedSiteCollectionGuids = @AllowedSiteCollectionGuids,
         LastModifiedDate = @LastModifiedDate
   WHERE Id = @LocationId

   SELECT @LastError = @@ERROR
   IF (@LastError <> 0) Or (@@Rowcount != 1)
   BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
   END

   UPDATE dbo.MSSLocationUrlTemplates
      SET
         UrlTemplate = @ConnectionUrlTemplate
   WHERE LocationId = @LocationId And TemplateType = @ConnectionUrlType

   SELECT @LastError = @@ERROR
   IF (@LastError <> 0) Or (@@Rowcount != 1)
   BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
   END

   UPDATE dbo.MSSLocationUrlTemplates
      SET
         UrlTemplate = @MoreUrlTemplate
    WHERE LocationId = @LocationId And TemplateType = @MoreUrlType

   SELECT @LastError = @@ERROR
   IF (@LastError <> 0) Or (@@Rowcount != 1)
   BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
   END

   UPDATE dbo.MSSLocationAuthentication
      SET
         Type = @Type,
         Data = @Data
    WHERE LocationId = @LocationId

   SELECT @LastError = @@ERROR
   IF (@LastError <> 0) Or (@@Rowcount != 1)
   BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
   END

   EXEC @LastError = dbo.proc_MSS_UpdateCacheInformation

   SELECT @LastError = @@ERROR
   IF @LastError <> 0
   BEGIN 
      ROLLBACK TRAN
      RETURN @LastError
   END

COMMIT TRAN

RETURN 0

GO
