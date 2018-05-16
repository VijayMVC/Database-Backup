/****** Object:  Table [dbo].[ev_AgendaSubItems]    Script Date: 5/15/2018 12:07:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ev_AgendaSubItems](
	[AgendaSubItemID] [int] IDENTITY(1,1) NOT NULL,
	[AgendaID] [int] NULL,
	[Required] [bit] NULL,
	[Level] [int] NULL,
	[AgendaName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceAmount] [money] NULL
) ON [PRIMARY]

GO
