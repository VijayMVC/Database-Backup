/****** Object:  Table [dbo].[FC_Financial]    Script Date: 5/15/2018 12:06:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_Financial](
	[referenceId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimRrFinancialStatement] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimRrFinanceApproved] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtCashRevenue] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtFranchiseeFee] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtNoteRevenue] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdPromissoryNotePrepareDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdPaymentPlanDated] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdPromissoryNoteDated] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtPaymentPlanAmount] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtPromissoryNoteAmount] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdPlanFinalPaymentDated] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimDdPromissoryFinalPaymentDated] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCbtContactTitle] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtFirstName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimTtLastName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimFinancial0] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fimCenterInfo_Id] [numeric](20, 0) NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
