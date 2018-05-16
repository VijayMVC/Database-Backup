/****** Object:  StoredProcedure [dbo].[tr_GetDirectorFBC]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE tr_GetDirectorFBC
(   @WebNumber int   )

AS

SELECT FBC = C.Key2, Director = D.UROM
FROM Contact.dbo.Contact1 C INNER JOIN Contact.dbo.Contact2 D ON C.AccountNo = D.AccountNo
AND C.UWEBNUMBER = convert(varchar(4), @WebNumber)
GO
