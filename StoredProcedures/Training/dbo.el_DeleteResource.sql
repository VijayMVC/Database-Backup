/****** Object:  StoredProcedure [dbo].[el_DeleteResource]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE el_DeleteResource 
(   @ID int  )

AS

DELETE FROM Resources
WHERE ID = @ID

GO
