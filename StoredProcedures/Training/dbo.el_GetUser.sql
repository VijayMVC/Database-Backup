/****** Object:  StoredProcedure [dbo].[el_GetUser]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE el_GetUser
(   @UserID int )

AS

SELECT WebID, UserID, UserName
FROM AWUsers
WHERE UserID = @UserID
GO
