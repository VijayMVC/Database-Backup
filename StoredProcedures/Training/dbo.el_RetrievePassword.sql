/****** Object:  StoredProcedure [dbo].[el_RetrievePassword]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE  PROCEDURE el_RetrievePassword 
(   @WebNumber int,
    @Username varchar(50)   )

AS

SELECT M.Title, U.Password
FROM eLearningModules M INNER JOIN AWUserModules A ON M.ID = A.ModuleID
INNER JOIN AWUsers U ON A.UserID = U.UserID AND U.WebID = @WebNumber AND U.Username = @Username
GO
