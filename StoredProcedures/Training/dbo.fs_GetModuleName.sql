/****** Object:  StoredProcedure [dbo].[fs_GetModuleName]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE fs_GetModuleName 
(   @ModuleID int   )
AS
SELECT Title, ModuleName
FROM eLearningModules
WHERE ID = @ModuleID
GO
