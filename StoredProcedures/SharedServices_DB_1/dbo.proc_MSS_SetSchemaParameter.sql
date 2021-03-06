/****** Object:  StoredProcedure [dbo].[proc_MSS_SetSchemaParameter]    Script Date: 5/15/2018 12:11:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetSchemaParameter
@ParamName nvarchar(40),
@IsString     bit,
@strValue     nvarchar(256),
@fltValue     float
AS

DECLARE @NameResult  nvarchar(40)
DECLARE @RetVal int  SET @RetVal = 0

BEGIN TRANSACTION
   select @NameResult=ParamName from MSSSchemaParameters where @ParamName  = ParamName
   if @NameResult is NULL
        Insert into MSSSchemaParameters Values( @ParamName, @IsString, @strValue, @fltValue )
   else
        Update MSSSchemaParameters Set IsString = @IsString,
                                             strValue = @strValue,   
                                             fltValue = @fltValue
                                        where ParamName = @ParamName
   SELECT @RetVal = @@ERROR

   update MSSSchemaHighLevelProps set LastGlobalProps = CURRENT_TIMESTAMP

   if ( 0 != @RetVal )
         SELECT @RetVal = @@ERROR

   if ( 0 = @RetVal )
          COMMIT TRANSACTION
   else
          ROLLBACK TRANSACTION
   return @RetVal

GO
