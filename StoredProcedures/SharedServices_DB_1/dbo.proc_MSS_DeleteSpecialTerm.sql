/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteSpecialTerm]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteSpecialTerm
@SpecialTermId INT
AS

DELETE MSSSpecialTerms where SpecialTermId = @SpecialTermId

GO
