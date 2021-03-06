/****** Object:  StoredProcedure [dbo].[tr_GetDirectorFBCAlt]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE tr_GetDirectorFBCAlt
(   @StoreNumber int   )

AS

SELECT FBC = C.Key2, Director = D.UROM
FROM Contact.dbo.Contact1 C INNER JOIN Contact.dbo.Contact2 D ON C.AccountNo = D.AccountNo
AND C.Key1 = convert(varchar(4), @StoreNumber)
GO
