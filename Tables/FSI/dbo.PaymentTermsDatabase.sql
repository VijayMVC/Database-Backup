/****** Object:  Table [dbo].[PaymentTermsDatabase]    Script Date: 5/15/2018 12:00:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PaymentTermsDatabase](
	[PaymentTermsID] [int] NOT NULL,
	[Terms] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Message] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DiscountDays] [int] NULL,
	[DiscountRate] [float] NULL,
	[LateDays] [int] NULL,
	[InterestFee] [float] NULL,
	[LateFromDueDate] [bit] NULL,
	[InterestOnInterest] [bit] NULL,
	[AccountCode] [int] NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PaymentTermsDatabase] PRIMARY KEY CLUSTERED 
(
	[PaymentTermsID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_FranchiseID]    Script Date: 5/15/2018 12:00:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_FranchiseID] ON [dbo].[PaymentTermsDatabase]
(
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [NCIDX_PaymentTermsDatabase_multiple1]    Script Date: 5/15/2018 12:00:54 PM ******/
CREATE NONCLUSTERED INDEX [NCIDX_PaymentTermsDatabase_multiple1] ON [dbo].[PaymentTermsDatabase]
(
	[zw_franchise_id] ASC,
	[PaymentTermsID] ASC
)
INCLUDE ( 	[LateDays]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
