/****** Object:  UserDefinedFunction [dbo].[Get_Contact_LastProduct]    Script Date: 5/15/2018 12:14:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE FUNCTION [dbo].[Get_Contact_LastProduct]( 
@contactID int=null,
@franchiseID char(7)
)

RETURNS varchar(100) AS  
BEGIN 

declare @LastProduct varchar(100)

if ( @contactID is not null )
BEGIN
	select top 1 @LastProduct = o.Description 
	
	from [Order Database] o 
	
	Where o.SalesTotal is not null 
	and O.contactID = @contactID
	and o.zw_franchise_id = @franchiseID

	order by o.OrderDate desc
END

return  @LastProduct
END







GO
