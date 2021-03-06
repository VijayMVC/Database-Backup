/****** Object:  Table [Product].[AVIFact]    Script Date: 5/15/2018 12:02:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Product].[AVIFact](
	[AVID] [int] NOT NULL,
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
	[OLTP_InsertDate] [datetime] NOT NULL,
	[OLTP_UpdateDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
