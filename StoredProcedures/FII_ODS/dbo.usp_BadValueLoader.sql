/****** Object:  StoredProcedure [dbo].[usp_BadValueLoader]    Script Date: 5/15/2018 12:09:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.usp_BadValueLoader 
@Table VARCHAR(50),@Key VARCHAR(50),@Name VARCHAR(50)
AS 
BEGIN
DECLARE @SQL VARCHAR(2000)

SET @SQL='SET IDENTITY_INSERT  '+@Table+' ON INSERT INTO '+ @Table +' ('+
@Key+','+@Name+',IsValid ) VALUES ( -255,''Bad'',0    ) SET IDENTITY_INSERT '+@Table+' OFF '

EXEC (@SQL)
PRINT @SQL
END
GO
