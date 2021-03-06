/****** Object:  Table [dbo].[AccountConsolidated_05082018]    Script Date: 5/15/2018 11:59:01 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AccountConsolidated_05082018](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FranchiseName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountId] [int] NULL,
	[LocationId] [int] NULL,
	[CompanyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryAccountContactId] [int] NULL,
	[BillingContactId] [int] NULL,
	[PrimaryPhoneNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryPhoneNumberTypeText] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SecondaryPhoneNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryPhoneNumberTypeText] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TertiaryPhoneNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TertiaryPhoneNumberTypeText] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndustryType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstOrderDate] [datetimeoffset](7) NULL,
	[LastOrderDate] [datetimeoffset](7) NULL,
	[LastSaleAmount] [decimal](18, 6) NULL,
	[BalanceDue] [money] NULL,
	[IsUpdate] [int] NULL,
	[IsRoyaltyOverriden] [bit] NULL,
	[CustomerType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FIICustomerID] [int] NULL,
	[FIIPrimaryContactID] [int] NULL,
	[FIIBillingContactID] [int] NULL,
	[UpdateCheckSum] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL
) ON [PRIMARY]

GO
