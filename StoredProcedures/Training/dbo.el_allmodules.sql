/****** Object:  StoredProcedure [dbo].[el_allmodules]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE el_AllModules 

AS

SELECT ID, Title, DisplayOrder
FROM eLearningModules
ORDER BY DisplayOrder
GO
