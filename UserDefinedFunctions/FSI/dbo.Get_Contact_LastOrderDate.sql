/****** Object:  UserDefinedFunction [dbo].[Get_Contact_LastOrderDate]    Script Date: 5/15/2018 12:14:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE FUNCTION [dbo].[Get_Contact_LastOrderDate]( 
@contactID int=null,
@franchiseID char(7)
)

RETURNS datetime AS  
BEGIN 

declare @LastOrderDate datetime

if ( @contactID is not null )
BEGIN
	select @LastOrderDate = max(o.OrderDate)
	
	from [Order Database] o 
	
	Where o.SalesTotal is not null 
	and O.contactID = @contactID
	and o.zw_franchise_id = @franchiseID

END

return  @LastOrderDate
END








GO
