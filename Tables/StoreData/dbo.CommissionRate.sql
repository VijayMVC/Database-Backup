/****** Object:  Table [dbo].[CommissionRate]    Script Date: 5/15/2018 12:06:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CommissionRate](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[PricingPlanTypeID] [int] NULL,
	[CommissionPlanID] [int] NULL,
	[Rate1Salesperson1] [float] NULL,
	[Rate2Salesperson1] [float] NULL,
	[Rate2Salesperson2] [float] NULL,
	[Rate3Salesperson1] [float] NULL,
	[Rate3Salesperson2] [float] NULL,
	[Rate3Salesperson3] [float] NULL,
 CONSTRAINT [CommissionRate_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
