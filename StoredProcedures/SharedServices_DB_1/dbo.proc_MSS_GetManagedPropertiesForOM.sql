/****** Object:  StoredProcedure [dbo].[proc_MSS_GetManagedPropertiesForOM]    Script Date: 5/15/2018 12:11:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetManagedPropertiesForOM
@ldate datetime = 0
AS

DECLARE @RetVal int  SET @RetVal = 0

Select  [PID], 
        [FriendlyName], 
        [PropertyDescription],
        [ManagedType], 

        [FullTextQueriable], 
        [Retrievable], 
        [Scoped], 
        [RespectPriority], 
        [RemoveDuplicates], 
        [NoDelete], 
        [NoMap],                        

        [HasMultipleValues], 
        [NoWordBreaker], 
        [NameNormalized], 
        [IncludeInMD5], 
        [Mapped], 
        [QueryIndependentRank], 
        [UserFlags],

        [WordBreakerOverride], 
        [Weight], 
        [LengthNormalization]
    from [dbo].[MSSManagedProperties]
          where @ldate <= LastModified
          and   Hidden = 0

return @RetVal

GO
