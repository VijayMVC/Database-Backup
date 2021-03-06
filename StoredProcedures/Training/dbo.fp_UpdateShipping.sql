/****** Object:  StoredProcedure [dbo].[fp_UpdateShipping]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE fp_UpdateShipping 
(   @ID int,
    @Address1 varchar(50),
    @Address2 varchar(50),
    @City varchar(50),
    @State varchar(2),
    @ZIP varchar(10),
    @Shipped bit,
    @Invoiced bit )

AS

UPDATE FP_Shipping
SET Address1 = @Address1,
Address2 = @Address2,
City = @City,
State = @State,
ZIP = @ZIP,
Shipped = @Shipped,
Invoiced = @Invoiced
WHERE InfoID = @ID

GO
