/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSynonymsCount]    Script Date: 5/15/2018 12:13:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSynonymsCount
@SpecialTermId INT,
@Count INT OUTPUT
AS
SELECT @Count = count(*) from MSSSynonyms where SpecialTermId = @SpecialTermId and Term not in 
(SELECT Term from MSSSpecialTerms where SpecialTermId = @SpecialTermId)

GO
