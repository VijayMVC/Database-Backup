/****** Object:  UserDefinedFunction [dbo].[CHARINDEX_CI]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
-- Similar to the Transact-SQL function Charindex, but regardless of collation settings,  
-- executes case-insensitive search  
CREATE FUNCTION CHARINDEX_CI
    (
      @expression1 NVARCHAR(4000) ,
      @expression2 NVARCHAR(4000) ,
      @start_location SMALLINT = 1
    )
RETURNS NVARCHAR(4000)
AS 
    BEGIN
        RETURN CHARINDEX( @expression1 COLLATE Latin1_General_CI_AS , @expression2   COLLATE Latin1_General_CI_AS , @start_location )
    END

GO
