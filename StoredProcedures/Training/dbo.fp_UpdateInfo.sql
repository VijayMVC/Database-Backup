/****** Object:  StoredProcedure [dbo].[fp_UpdateInfo]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE fp_UpdateInfo 
(   @ID int,
    @FirstName varchar(50),
    @LastName varchar(50),
    @Address1 varchar(50),
    @Address2 varchar(50),
    @City varchar(50),
    @State varchar(2),
    @ZIP varchar(10),
    @Email varchar(50),
    @Phone varchar(15)   )

AS

UPDATE FP_Info
SET FirstName = @FirstName,
LastName = @LastName,
Address1 = @Address1,
Address2 = @Address2, 
City = @City,
State = @State,
ZIP = @ZIP,
Phone = @Phone,
Email = @Email
WHERE ID = @ID

GO
