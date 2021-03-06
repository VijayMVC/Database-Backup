/****** Object:  Table [dbo].[Sequence]    Script Date: 5/15/2018 12:06:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Sequence](
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[NextNumber] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [Sequence_PK]    Script Date: 5/15/2018 12:06:56 PM ******/
CREATE UNIQUE CLUSTERED INDEX [Sequence_PK] ON [dbo].[Sequence]
(
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
