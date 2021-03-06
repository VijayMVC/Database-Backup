/****** Object:  Table [dbo].[CustomRange]    Script Date: 5/15/2018 12:06:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CustomRange](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[RangeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortIndex] [float] NULL,
	[StartDateTime] [datetime] NULL,
	[StartDTDif] [datetime] NULL,
	[StartDTFixed] [bit] NULL,
	[FlexStartType] [int] NULL,
	[StartRangeType] [int] NULL,
	[EndDateTime] [datetime] NULL,
	[EndDTDif] [datetime] NULL,
	[EndDTFixed] [bit] NULL,
	[FlexEndType] [int] NULL,
	[EndRangeType] [int] NULL,
 CONSTRAINT [CustomRange_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
