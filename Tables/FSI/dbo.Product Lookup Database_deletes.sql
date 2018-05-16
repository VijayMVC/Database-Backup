/****** Object:  Table [dbo].[Product Lookup Database_deletes]    Script Date: 5/15/2018 12:00:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Product Lookup Database_deletes](
	[ID] [int] NOT NULL,
	[PricingStructure] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Units] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] NOT NULL
) ON [PRIMARY]

GO
