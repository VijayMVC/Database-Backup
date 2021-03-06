/****** Object:  Table [dbo].[StoresToProcessCubes]    Script Date: 5/15/2018 12:00:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[StoresToProcessCubes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [pk_storestoprocesscubes_zwfranchiseid]    Script Date: 5/15/2018 12:00:57 PM ******/
CREATE CLUSTERED INDEX [pk_storestoprocesscubes_zwfranchiseid] ON [dbo].[StoresToProcessCubes]
(
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
