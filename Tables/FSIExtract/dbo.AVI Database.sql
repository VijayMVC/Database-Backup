/****** Object:  Table [dbo].[AVI Database]    Script Date: 5/15/2018 12:01:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AVI Database](
	[AVID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[AVCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrintAs] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnswerStructure] [smallint] NULL,
	[PricingStructure] [smallint] NULL,
	[SetupCharge] [float] NULL,
	[PerUnitPercentage] [float] NULL,
	[MinPerUnitCharge] [float] NULL,
	[MinTotalCharge] [float] NULL,
	[MinPerAVCharge] [float] NULL,
	[SortLevel] [int] NULL,
	[DimensionUnits] [int] NULL,
	[FixedPerPieceCharge] [float] NULL,
	[FixedPerAVCharge] [float] NULL,
	[PerPiecePerAVCharge] [float] NULL,
	[AreaCharge] [float] NULL,
	[LengthCharge] [float] NULL,
	[FormulaCharge] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PerimeterCharge] [float] NULL,
	[AnswerRequired] [bit] NULL,
	[SetupDouble] [bit] NULL,
	[BaseDouble] [bit] NULL,
	[MinDouble] [bit] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
