/****** Object:  StoredProcedure [dbo].[sub_GetSubsidyTypeYears]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidyTypeYears
AS
SELECT DISTINCT(SubDCalanderYear)
FROM SubsidyDtl
ORDER BY SubDCalanderYear



GO
