/****** Object:  StoredProcedure [dbo].[el_InsertAWUser]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE el_InsertAWUser
(   @Username varchar(6),
    @Password varchar(50),
    @WebID int )

AS


INSERT INTO AWUsers(UserName, Password, WebID)
VALUES(@UserName, @Password, @WebID)

BEGIN
 SELECT InsertedRecord = @@Identity
END
GO
