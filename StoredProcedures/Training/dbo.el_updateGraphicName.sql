/****** Object:  StoredProcedure [dbo].[el_updateGraphicName]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE el_updateGraphicName
(   @FileName varchar(50),
    @ID int )

AS

UPDATE eLearningModules
SET GraphicName = @FileName
WHERE ID = @ID
GO
