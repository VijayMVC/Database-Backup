/****** Object:  StoredProcedure [dbo].[zw_Order_Details_Deletions]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[zw_Order_Details_Deletions]
AS
BEGIN

SET NOCOUNT ON;

DECLARE @OrderID INT, @maxorderdetailid INT
declare @zw_franchise_id VARCHAR(7)

DECLARE ordercur CURSOR LOCAL  FAST_FORWARD FOR
select o.OrderId, o.zw_franchise_id
from [Order Database] o

OPEN ordercur

FETCH NEXT FROM ordercur
INTO @OrderID, @zw_franchise_id

WHILE @@FETCH_STATUS = 0
BEGIN

	select @maxorderdetailid = max(orderdetailid)
	from [order details database] 
	where zw_franchise_id = @zw_franchise_id and lineitemnumber = 1 
	and orderid = @OrderID

	Insert into _zw_Order_Details_Deleted
	SELECT * from [order details database] 
    where orderdetailid < @maxorderdetailid
    and zw_franchise_id = @zw_franchise_id	and orderid = @OrderID

	Delete from [order details database] 
	where orderdetailid < @maxorderdetailid
    and zw_franchise_id = @zw_franchise_id	and orderid = @OrderID

FETCH NEXT FROM ordercur
INTO @OrderID, @zw_franchise_id
END

CLOSE ordercur

DEALLOCATE ordercur

END
GO
