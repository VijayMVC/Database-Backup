/****** Object:  Table [dbo].[Payment Methods Database_deletes]    Script Date: 5/15/2018 12:00:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Payment Methods Database_deletes](
	[PaymentMethodID] [int] NOT NULL,
	[PaymentMethod] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentMethodType] [int] NULL,
	[AccountCode] [int] NULL,
	[Text] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveMethod] [bit] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] NOT NULL,
	[ProcessOnline] [bit] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
