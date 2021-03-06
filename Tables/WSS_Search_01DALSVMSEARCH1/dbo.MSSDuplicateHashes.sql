/****** Object:  Table [dbo].[MSSDuplicateHashes]    Script Date: 5/15/2018 12:09:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSDuplicateHashes](
	[DocId] [int] NOT NULL,
	[HashVal] [bigint] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_DOCID]    Script Date: 5/15/2018 12:09:09 PM ******/
CREATE CLUSTERED INDEX [IX_DOCID] ON [dbo].[MSSDuplicateHashes]
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
