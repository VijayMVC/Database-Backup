/****** Object:  StoredProcedure [dbo].[mk_FileUploadOptionsGet]    Script Date: 5/15/2018 12:10:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE mk_FileUploadOptionsGet 
AS
SELECT *
FROM FileUploadOptions
ORDER BY Directory



GO
