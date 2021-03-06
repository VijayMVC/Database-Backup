/****** Object:  Table [dbo].[PaymentTermsDatabase_deletes]    Script Date: 5/15/2018 12:06:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PaymentTermsDatabase_deletes](
	[PaymentTermsID] [int] NULL,
	[Terms] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Message] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DiscountDays] [int] NULL,
	[DiscountRate] [float] NULL,
	[LateDays] [int] NULL,
	[InterestFee] [float] NULL,
	[LateFromDueDate] [bit] NULL,
	[InterestOnInterest] [bit] NULL,
	[AccountCode] [int] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_active] [bit] NULL,
	[zw_pk_id] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
