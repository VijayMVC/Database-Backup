/****** Object:  UserDefinedFunction [dbo].[Get_Max_OrderDetailID]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON






CREATE FUNCTION [dbo].[Get_Max_OrderDetailID]( @OrderID int=null,@franchiseID char(7))
RETURNS varchar(50) AS  
BEGIN 

declare @OrderDetailID varchar(50)


if ( @OrderID is not null )
begin
	select @OrderDetailID = max(orderdetailid)
	
	from [order details database] 
where zw_franchise_id = @franchiseID and lineitemnumber = 1 
and orderid = @OrderID
end

return  @OrderDetailID
END
GO
