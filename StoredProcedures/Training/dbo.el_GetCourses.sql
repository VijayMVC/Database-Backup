/****** Object:  StoredProcedure [dbo].[el_GetCourses]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE el_GetCourses
(   @UserID int,
    @ModuleID int )

AS

SELECT * 
FROM AWUserModules 
WHERE UserID = @UserID
AND ModuleID = @ModuleID
GO
