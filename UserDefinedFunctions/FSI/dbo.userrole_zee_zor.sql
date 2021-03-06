/****** Object:  UserDefinedFunction [dbo].[userrole_zee_zor]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [dbo].[userrole_zee_zor] (
@user_id uniqueidentifier
)  
RETURNS char(1)
AS  
BEGIN 
DECLARE @role_char char(1), @name_role varchar(50)
SELECT top 1 @name_role = r.name_role
FROM zg_UserRole ur JOIN zg_Role r ON (ur.role_id = r.role_id)
WHERE ur.[user_id] = @user_id
ORDER BY r.role_id
IF( @name_role = 'Franchisor User' ) 
	SET @role_char = 'C'
ELSE IF(( @name_role = 'Franchise User' ) OR ( @name_role = 'Franchise User - Read Only' ))
	SET @role_char = 'Z'
ELSE
	SET @role_char = ''
RETURN @role_char
END

GO
