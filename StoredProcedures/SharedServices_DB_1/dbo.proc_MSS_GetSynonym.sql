/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSynonym]    Script Date: 5/15/2018 12:11:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSynonym
@SpecialTermId INT,
@Term NVARCHAR(100)
AS

SELECT Term from MSSSynonyms where SpecialTermId = @SpecialTermId and Term = @Term and Term not in 
(SELECT Term from MSSSpecialTerms where SpecialTermId = @SpecialTermId)

GO
