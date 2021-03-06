/****** Object:  Table [dbo].[Estimate Modifiers Database]    Script Date: 5/15/2018 12:00:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Estimate Modifiers Database](
	[ID] [int] NOT NULL,
	[ORDERDETAILID] [int] NULL,
	[AVID] [int] NULL,
	[ORDERID] [int] NULL,
	[ANSWER] [int] NULL,
	[PRICE] [float] NULL,
	[PRICEOVERRIDDEN] [bit] NULL,
	[CALCPRICE] [float] NULL,
	[SYS_DI] [datetime] NULL,
	[SYS_DU] [datetime] NULL,
	[ZW_FRANCHISE_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [ESTIMATEMODIFIERSDATABASE_CNSTR_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ZW_FRANCHISE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
