/****** Object:  Table [dbo].[Contact Database_deletes]    Script Date: 5/15/2018 12:06:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Contact Database_deletes](
	[ContactID] [int] NULL,
	[StoreID] [int] NULL,
	[CustomerID] [int] NULL,
	[FirstName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaxNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2AreaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneType] [int] NULL,
	[P3AreaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P3PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P3PhoneType] [int] NULL,
	[PrimaryContact] [bit] NULL,
	[ShippingContact] [bit] NULL,
	[APContact] [bit] NULL,
	[InvoicingContact] [bit] NULL,
	[AlternateAddress] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortOrder] [int] NULL,
	[BirthMonth] [int] NULL,
	[BirthDay] [int] NULL,
	[IsActive] [bit] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_active] [bit] NULL,
	[zw_pk_id] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
