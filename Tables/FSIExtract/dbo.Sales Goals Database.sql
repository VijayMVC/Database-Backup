/****** Object:  Table [dbo].[Sales Goals Database]    Script Date: 5/15/2018 12:01:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Sales Goals Database](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[MonthText] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month] [smallint] NULL,
	[Year] [smallint] NULL,
	[SalesTotal] [money] NULL,
	[SalesWIP1] [money] NULL,
	[SalesWIP2] [money] NULL,
	[SalesWIP3] [money] NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[YearOf] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
