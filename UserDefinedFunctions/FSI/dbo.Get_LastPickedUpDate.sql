/****** Object:  UserDefinedFunction [dbo].[Get_LastPickedUpDate]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE FUNCTION [dbo].[Get_LastPickedUpDate]( 
@customerID int=null,
@ContactID int=null,
@franchiseID char(7)
)

RETURNS datetime AS  
BEGIN 

declare @LastPickedUpDate datetime

SET @LastPickedUpDate = [dbo].[Get_Contact_LastPickedUpDate]( @ContactID, @franchiseID )

return  COALESCE(@LastPickedUpDate,'1900-01-01')
END








GO
