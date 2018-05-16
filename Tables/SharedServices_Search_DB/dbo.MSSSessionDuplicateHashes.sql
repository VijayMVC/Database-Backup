/****** Object:  Table [dbo].[MSSSessionDuplicateHashes]    Script Date: 5/15/2018 12:05:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSessionDuplicateHashes](
	[DocId] [int] NOT NULL,
	[HashVal] [bigint] NOT NULL,
	[RecordExists] [bit] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSSessionDuplicateHashes]    Script Date: 5/15/2018 12:05:29 PM ******/
CREATE CLUSTERED INDEX [IX_MSSSessionDuplicateHashes] ON [dbo].[MSSSessionDuplicateHashes]
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSSessionDuplicateHashes] ADD  DEFAULT ((0)) FOR [RecordExists]
GO
