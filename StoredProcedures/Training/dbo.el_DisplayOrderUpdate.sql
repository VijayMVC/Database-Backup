/****** Object:  StoredProcedure [dbo].[el_DisplayOrderUpdate]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE el_DisplayOrderUpdate
(   @DisplayOrder int,
    @TempID int )
AS

UPDATE eLearningModules
SET DisplayOrder = @DisplayOrder
WHERE ID = @TempID
GO
