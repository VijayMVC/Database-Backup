/****** Object:  Table [dbo].[MSSSessionDuplicateHashesAlt]    Script Date: 5/15/2018 12:05:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSessionDuplicateHashesAlt](
	[DocId] [int] NOT NULL,
	[HashVal] [bigint] NOT NULL,
	[RecordExists] [bit] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSSessionDuplicateHashesAlt]    Script Date: 5/15/2018 12:05:29 PM ******/
CREATE CLUSTERED INDEX [IX_MSSSessionDuplicateHashesAlt] ON [dbo].[MSSSessionDuplicateHashesAlt]
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSSessionDuplicateHashesAlt] ADD  DEFAULT ((0)) FOR [RecordExists]
GO
