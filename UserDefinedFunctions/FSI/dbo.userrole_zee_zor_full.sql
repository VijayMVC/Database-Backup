/****** Object:  UserDefinedFunction [dbo].[userrole_zee_zor_full]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE FUNCTION [dbo].[userrole_zee_zor_full] (
@user_id uniqueidentifier
)  
RETURNS varchar(50)
AS  
BEGIN 

DECLARE @role_name varchar(50), @name_role varchar(50)

SELECT top 1 @name_role = r.name_role
FROM zg_UserRole ur JOIN zg_Role r ON (ur.role_id = r.role_id)
WHERE ur.[user_id] = @user_id
ORDER BY r.role_id

IF(( @name_role = 'Franchisor User' )  OR ( @name_role = 'Franchisor User - Read Only' ))
	SET @role_name = 'Franchisor'
ELSE IF(( @name_role = 'Franchise User' ) OR ( @name_role = 'Franchise User - Read Only' )) 
	SET @role_name = 'Franchise'
ELSE
	SET @role_name = @name_role
RETURN @role_name

END




GO
