/****** Object:  View [dbo].[GetAWUsers]    Script Date: 5/15/2018 12:14:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.GetAWUsers
AS
SELECT     U.Username, U.WebID, M.Title
FROM         dbo.AWUsers U INNER JOIN AWUserModules S ON U.UserID = S.UserID INNER JOIN eLearningModules M ON S.ModuleID = M.ID
WHERE U.WebID != 900 AND U.WebID != 999


GO
