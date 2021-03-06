/****** Object:  Table [dbo].[Volume Discount Database]    Script Date: 5/15/2018 12:01:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Volume Discount Database](
	[VolumeCategoryID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Discount] [float] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VolumeDiscountDatabase] PRIMARY KEY CLUSTERED 
(
	[VolumeCategoryID] ASC,
	[Quantity] ASC,
	[StoreID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
