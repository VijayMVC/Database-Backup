/****** Object:  UserDefinedFunction [dbo].[Get_LastOrderAmount]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE FUNCTION [dbo].[Get_LastOrderAmount]( 
@customerID int=null,
@ContactID int=null,
@franchiseID char(7)
)

RETURNS money AS  
BEGIN 

declare @LastOrderAmount money
SET @LastOrderAmount = [dbo].[Get_Contact_LastOrderAmount]( @ContactID, @franchiseID )
return COALESCE(@LastOrderAmount,0)

/*
declare @LastOrderAmount money
declare @ContactLastOrderDate datetime
declare @CustomerLastOrderDate datetime

SET @ContactLastOrderDate = [dbo].[Get_Contact_LastOrderDate]( @ContactID, @franchiseID )
SET @CustomerLastOrderDate = [dbo].[Get_Customer_LastOrderDate]( @customerID, @franchiseID )

SET @ContactLastOrderDate = COALESCE(@ContactLastOrderDate,'1900-01-01')
SET @CustomerLastOrderDate = COALESCE(@CustomerLastOrderDate,'1900-01-01')

IF( @ContactLastOrderDate > @CustomerLastOrderDate )
	SET @LastOrderAmount = [dbo].[Get_Contact_LastOrderAmount]( @ContactID, @franchiseID )
else
	SET @LastOrderAmount = [dbo].[Get_Customer_LastOrderAmount]( @customerID, @franchiseID )

return COALESCE(@LastOrderAmount,0)
*/

END










GO
