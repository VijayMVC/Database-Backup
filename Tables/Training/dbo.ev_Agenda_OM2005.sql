/****** Object:  Table [dbo].[ev_Agenda_OM2005]    Script Date: 5/15/2018 12:07:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ev_Agenda_OM2005](
	[AgendaID] [int] IDENTITY(1,1) NOT NULL,
	[AgendaTypeID] [int] NULL,
	[EventID] [int] NULL,
	[ItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[MaxSeats] [int] NULL,
	[MaxWait] [int] NULL,
	[InvoiceAmount] [money] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
