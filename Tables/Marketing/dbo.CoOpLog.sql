/****** Object:  Table [dbo].[CoOpLog]    Script Date: 5/15/2018 12:02:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CoOpLog](
	[CoOpLogID] [int] NOT NULL,
	[SubsidyQualifierID] [int] NULL,
	[CoOpID] [int] NULL,
	[Year] [int] NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceAmount] [real] NULL,
	[AmountReimbursed] [real] NULL,
	[UsageDateFrom] [datetime] NULL,
	[UsageDateTo] [datetime] NULL,
	[ProcessDate] [datetime] NULL,
 CONSTRAINT [PK_CoOpLog] PRIMARY KEY CLUSTERED 
(
	[CoOpLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
