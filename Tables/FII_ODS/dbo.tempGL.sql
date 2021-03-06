/****** Object:  Table [dbo].[tempGL]    Script Date: 5/15/2018 11:59:27 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tempGL](
	[CountryCode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionDateTime] [datetime] NULL,
	[OrderID] [int] NULL,
	[AccountCode] [int] NULL,
	[SubAccountCode] [int] NULL,
	[Amount] [money] NULL,
	[System] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLDate]  AS (CONVERT([date],[TransactionDateTime])) PERSISTED
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Hint_tempGL_TransactionDateTime_INC_ZW_Franchise_ID_Amount]    Script Date: 5/15/2018 11:59:27 AM ******/
CREATE NONCLUSTERED INDEX [Hint_tempGL_TransactionDateTime_INC_ZW_Franchise_ID_Amount] ON [dbo].[tempGL]
(
	[TransactionDateTime] ASC
)
INCLUDE ( 	[ZW_Franchise_ID],
	[Amount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_tempGL_ZW_Franchise_ID_TransactionDateTime_inc_Amount]    Script Date: 5/15/2018 11:59:27 AM ******/
CREATE NONCLUSTERED INDEX [Hint_tempGL_ZW_Franchise_ID_TransactionDateTime_inc_Amount] ON [dbo].[tempGL]
(
	[ZW_Franchise_ID] ASC,
	[TransactionDateTime] ASC
)
INCLUDE ( 	[Amount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_TransactionDateTime_ZW_OrderID]    Script Date: 5/15/2018 11:59:27 AM ******/
CREATE NONCLUSTERED INDEX [Hint_TransactionDateTime_ZW_OrderID] ON [dbo].[tempGL]
(
	[TransactionDateTime] ASC
)
INCLUDE ( 	[ZW_Franchise_ID],
	[OrderID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_ZW_Franchise_ID_inc_CountryCode_Amount_GLDate]    Script Date: 5/15/2018 11:59:27 AM ******/
CREATE NONCLUSTERED INDEX [Hint_ZW_Franchise_ID_inc_CountryCode_Amount_GLDate] ON [dbo].[tempGL]
(
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[CountryCode],
	[Amount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_ZW_TransactionDateTime_INC_OrderID]    Script Date: 5/15/2018 11:59:27 AM ******/
CREATE NONCLUSTERED INDEX [Hint_ZW_TransactionDateTime_INC_OrderID] ON [dbo].[tempGL]
(
	[ZW_Franchise_ID] ASC,
	[TransactionDateTime] ASC
)
INCLUDE ( 	[OrderID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
