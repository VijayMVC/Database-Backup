/****** Object:  Table [dbo].[TempGroup2]    Script Date: 5/15/2018 11:59:27 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TempGroup2](
	[Sales] [decimal](19, 6) NULL,
	[Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IDX_TempGroup2]    Script Date: 5/15/2018 11:59:27 AM ******/
CREATE NONCLUSTERED INDEX [IDX_TempGroup2] ON [dbo].[TempGroup2]
(
	[Product] ASC
)
INCLUDE ( 	[Sales]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
GO
