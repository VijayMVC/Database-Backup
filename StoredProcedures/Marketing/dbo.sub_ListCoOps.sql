/****** Object:  StoredProcedure [dbo].[sub_ListCoOps]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_ListCoOps
AS
SELECT A.CoOpID, A.CoOpName, StoreCount = (SELECT count(*) FROM CoOpStores WHERE CoOpID = A.CoOpID)
FROM CoOps A
ORDER BY A.CoOpName



GO
