/****** Object:  StoredProcedure [dbo].[sub_GetCategories]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetCategories
AS
SELECT *
FROM SubsidyCategories
ORDER BY CategoryName



GO
