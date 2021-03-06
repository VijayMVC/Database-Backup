/****** Object:  Table [dbo].[MSSSynonyms]    Script Date: 5/15/2018 12:09:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSynonyms](
	[SpecialTermID] [int] NOT NULL,
	[Term] [nvarchar](100) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
 CONSTRAINT [U_Synonym] UNIQUE NONCLUSTERED 
(
	[SpecialTermID] ASC,
	[Term] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_TERM_SYNONYMS]    Script Date: 5/15/2018 12:09:13 PM ******/
CREATE CLUSTERED INDEX [IX_TERM_SYNONYMS] ON [dbo].[MSSSynonyms]
(
	[Term] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSSynonyms]  WITH CHECK ADD  CONSTRAINT [FK_MSSSynonyms_SpecialTermID] FOREIGN KEY([SpecialTermID])
REFERENCES [dbo].[MSSSpecialTerms] ([SpecialTermID])
ON DELETE CASCADE
ALTER TABLE [dbo].[MSSSynonyms] CHECK CONSTRAINT [FK_MSSSynonyms_SpecialTermID]
/****** Object:  Trigger [dbo].[trigger_SynonymsTrig]    Script Date: 5/15/2018 12:09:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER trigger_SynonymsTrig
ON MSSSynonyms
after INSERT, UPDATE
AS
IF EXISTS 
(SELECT * FROM 
(SELECT count(*) AS cnt, a.Term, ConsumerGpId 
FROM MSSSynonyms a, MSSConsumerGpLink b, inserted c
WHERE a.Specialtermid = b.SpecialTermId 
and a.Term = c.Term 
GROUP BY a.term, consumergpid) d
WHERE d.cnt > 1 )
BEGIN 
	RAISERROR('SPECIAL TERM ERROR',16,1)
	ROLLBACK TRAN
END

GO
