/****** Object:  StoredProcedure [dbo].[proc_MSS_AddSynonym]    Script Date: 5/15/2018 12:13:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddSynonym
@SpecialTermId INT,
@Term NVARCHAR(100) AS
INSERT INTO MSSSynonyms VALUES (@SpecialTermId, @Term)

GO
