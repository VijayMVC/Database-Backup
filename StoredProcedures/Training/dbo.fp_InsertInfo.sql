/****** Object:  StoredProcedure [dbo].[fp_InsertInfo]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE fp_InsertInfo 
(   @Store int,
    @FirstName varchar(50),
    @LastName varchar(50),
    @Address1 varchar(50),
    @Address2 varchar(50),
    @City varchar(50),
    @State varchar(2),
    @ZIP varchar(10),
    @Email varchar(50),
    @Phone varchar(15),
    @Shipping bit   )

AS

DECLARE @ID int 

INSERT INTO FP_Info
 ( Store,
   FirstName,
   LastName,
   Address1,
   Address2, 
   City,
   State,
   ZIP,
   Phone,
   Email,
   Shipping )
VALUES
 ( @Store,
   @FirstName,
   @LastName,
   @Address1,
   @Address2,
   @City,
   @State,
   @ZIP,
   @Phone,
   @Email,
   @Shipping )

SELECT @ID = @@IDENTITY
SELECT @ID ID

GO
