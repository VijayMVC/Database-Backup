/****** Object:  StoredProcedure [dbo].[proc_MSS_SetManagedPropertyAllOM]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetManagedPropertyAllOM
@PID                       int,
@Name                      nvarchar(440),
@Description               nvarchar(2048),
@ManagedType               int,
@FullTextQueriable         bit,
@Retrievable               bit,
@EnabledForScoping         bit,
@RespectPriority           bit,
@RemoveDuplicates          bit,
@NoWordBreaker             bit,
@IsNameNormalized          bit,
@IncludeInMd5              bit,
@Mapped                    bit,
@QueryIndependentRank      bit,
@UserFlags                 smallInt,
@WordBreakerOverrride      int,
@Weight                    float,
@LengthNormalization       float
as
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @Modified datetime SET @Modified = CURRENT_TIMESTAMP
BEGIN TRANSACTION
 update MSSManagedProperties Set FriendlyName = @Name,
                                 PropertyDescription = @Description,
                                 ManagedType = @ManagedType,
                                 FullTextQueriable = @FullTextQueriable,
                                 Retrievable = @Retrievable,
                                 Scoped = @EnabledForScoping,
                                 RespectPriority = @RespectPriority,
                                 RemoveDuplicates = @RemoveDuplicates,
                                 NoWordBreaker = @NoWordBreaker,
                                 NameNormalized = @IsNameNormalized,
                                 IncludeInMD5 = @IncludeInMd5,
                                 Mapped = @Mapped,                             
                                 QueryIndependentRank = @QueryIndependentRank,
                                 userFlags = @UserFlags,
                                 WordBreakerOverride = @WordBreakerOverrride,
                                 Weight = @Weight,
                                 LengthNormalization = @LengthNormalization,
                                 LastModified = @Modified
                    where @PID = PID
 SELECT @RetVal = @@ERROR
 update MSSSchemaHighLevelProps set LastManagedProp = @Modified
 if ( 0 != @RetVal )
    SELECT @RetVal = @@ERROR
 if ( 0 = @RetVal )
    COMMIT TRANSACTION
 else
    ROLLBACK TRANSACTION
return @RetVal

GO
