/****** Object:  StoredProcedure [dbo].[el_getModules]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE el_getModules

AS

SELECT *
FROM eLearningModules
ORDER BY DisplayOrder
GO
