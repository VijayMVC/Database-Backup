/****** Object:  StoredProcedure [dbo].[DeleteModelPerspectives]    Script Date: 5/15/2018 12:09:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[DeleteModelPerspectives]
@ModelID as uniqueidentifier
AS

DELETE
FROM [ModelPerspective]
WHERE [ModelID] = @ModelID

GO
