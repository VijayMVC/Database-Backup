/****** Object:  StoredProcedure [dbo].[proc_MSS_GetDefinition]    Script Date: 5/15/2018 12:13:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetDefinition
@Term NVARCHAR(255) AS
SELECT top 10
x.DocId, 
y.Sdid,
x.Sentence, 
x.TermOffset, 
x.TermLength,
z.strVal + ISNULL(cast(cast(z.binVal as varbinary(4000)) AS nvarchar(2000)), ''), -- href
w.strVal + ISNULL(cast(cast(w.binVal as varbinary(4000)) AS nvarchar(2000)), '') -- title
FROM MSSDefinitions x with(nolock), MSSDocSdids y with(nolock), MSSDocProps z with(nolock), MSSDocProps w with(nolock)
WHERE x.Term = @Term AND x.DocId = y.DocId AND x.DocId = z.DocId AND x.DocId = w.DocId AND z.Pid = 7 AND w.Pid = 2

GO
