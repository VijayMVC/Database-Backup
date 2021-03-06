/****** Object:  Table [dbo].[ContactConsolidated]    Script Date: 5/15/2018 12:06:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ContactConsolidated](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FranchiseName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactId] [int] NULL,
	[AccountId] [int] NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Position] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryPhoneNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryPhoneNumberExtension] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryPhoneNumberType] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryPhoneNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryPhoneNumberType] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TertiaryPhoneNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TertiaryPhoneNumberType] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsUpdate] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[FIIContactID] [int] NULL,
	[FIICustomerID] [int] NULL,
	[ContactStatus] [varchar](127) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ContactConsolidated] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ContactConsolidated] ADD  CONSTRAINT [DF_ContactConsolidated_OLTP_InsertDate]  DEFAULT (getdate()) FOR [OLTP_InsertDate]
GO
