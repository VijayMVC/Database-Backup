/****** Object:  StoredProcedure [dbo].[sub_GetAllSubsidyTypes]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetAllSubsidyTypes
AS
SELECT SubHDesc, SubHID FROM SubsidyHdr
GROUP BY SubHDesc, SubHID



GO
