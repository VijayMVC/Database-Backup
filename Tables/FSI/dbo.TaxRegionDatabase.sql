/****** Object:  Table [dbo].[TaxRegionDatabase]    Script Date: 5/15/2018 12:00:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TaxRegionDatabase](
	[TaxRegionID] [int] NOT NULL,
	[Region] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tax1Rate] [float] NULL,
	[Tax2Rate] [float] NULL,
	[Tax3Rate] [float] NULL,
	[TaxIDNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxesAlwaysRoundUp] [bit] NULL,
	[Tax1Max] [float] NULL,
	[Tax2Max] [float] NULL,
	[Tax3Max] [float] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TaxRegionDatabase] PRIMARY KEY CLUSTERED 
(
	[TaxRegionID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
