/****** Object:  Table [dbo].[ev_PaymentInfo]    Script Date: 5/15/2018 12:07:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ev_PaymentInfo](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[AttendantID] [int] NULL,
	[CardNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PID] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExpMonth] [int] NULL,
	[ExpYear] [int] NULL,
	[NameOnCard] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subtotal] [money] NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO
