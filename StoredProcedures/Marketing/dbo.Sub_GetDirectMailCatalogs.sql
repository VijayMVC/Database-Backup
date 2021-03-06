/****** Object:  StoredProcedure [dbo].[Sub_GetDirectMailCatalogs]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE Sub_GetDirectMailCatalogs AS
SELECT C.CatID, 
	 C.CatName,
	 'MATID:' + CAST(M.MatID AS VARCHAR) MatID,
	 M.MatName
FROM 
	category C 
INNER JOIN 
	productCategory PC 
ON 
	PC.CatID = C.CatID 
INNER JOIN 
	Material M 
ON 
	M.MatID = PC.PrdID and M.MatDisabled = 'N'

UNION

SELECT DISTINCT 
	C.CatID, 
       	C.CatName,
       	'MATGHID:' + CAST(hdr.MatGHID AS VARCHAR) MatID,
             hdr.MatGHName MatName
FROM 
	materialGroupsHdr hdr 
INNER JOIN
	 materialGroupsDtl dtl
ON
	 hdr.MatGHID = dtl.MatGHID
INNER JOIN
	 material mat
ON
	 mat.MAtID = MatGPrdID
INNER JOIN
	 productCategory PC 
ON
	 mat.MatID = PC.PrdID
INNER JOIN 
	category c
ON 
	PC.CatID = C.CatID 
WHERE 
	hdr.MatGHType = 1
	AND YEAR(dtl.MatGDMailDate) >= 2005  -- It was hdr.MatGHSignUpDate -- ISSUE MSUB-4
	AND hdr.MatGHSignUpDate IS NOT NULL

ORDER BY C.CatName, M.MatName
GO
