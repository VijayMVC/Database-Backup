/****** Object:  StoredProcedure [dbo].[el_GetAWModules]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE el_GetAWModules

AS

SELECT *
FROM eLearningModules
WHERE AW = 1
ORDER BY DisplayOrder
GO
