/****** Object:  StoredProcedure [dbo].[el_updateModuleName]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE el_updateModuleName 
(	@ID int,
	@ModuleName varchar(50)		)

AS

 UPDATE eLearningModules
SET 
	ModuleName = @ModuleName
WHERE ID = @ID

GO
