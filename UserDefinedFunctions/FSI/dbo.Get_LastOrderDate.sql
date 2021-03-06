/****** Object:  UserDefinedFunction [dbo].[Get_LastOrderDate]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE FUNCTION [dbo].[Get_LastOrderDate]( 
@customerID int=null,
@ContactID int=null,
@franchiseID char(7)
)

RETURNS datetime AS  
BEGIN 

declare @ContactLastOrderDate datetime
SET @ContactLastOrderDate = [dbo].[Get_Contact_LastOrderDate]( @ContactID, @franchiseID )
return COALESCE(@ContactLastOrderDate,'1900-01-01')

/*
declare @ContactLastOrderDate datetime
declare @CustomerLastOrderDate datetime
declare @LastOrderDate datetime

SET @ContactLastOrderDate = [dbo].[Get_Contact_LastOrderDate]( @ContactID, @franchiseID )
SET @CustomerLastOrderDate = [dbo].[Get_Customer_LastOrderDate]( @customerID, @franchiseID )

SET @ContactLastOrderDate = COALESCE(@ContactLastOrderDate,'1900-01-01')
SET @CustomerLastOrderDate = COALESCE(@CustomerLastOrderDate,'1900-01-01')

IF( @ContactLastOrderDate > @CustomerLastOrderDate )
	SET @LastOrderDate = @ContactLastOrderDate
else
	SET @LastOrderDate = @CustomerLastOrderDate

return @LastOrderDate
*/

END









GO
