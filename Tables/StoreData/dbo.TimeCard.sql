/****** Object:  Table [dbo].[TimeCard]    Script Date: 5/15/2018 12:06:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TimeCard](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[StatusID] [int] NULL,
	[StatusName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AdjustedByID] [int] NULL,
	[ManuallyAdjusted] [bit] NULL,
	[TransDetailID] [int] NULL,
	[TransDetailStoreID] [int] NULL,
	[TransDetailClassTypeID] [int] NULL,
	[TransPartID] [int] NULL,
	[TransPartStoreID] [int] NULL,
	[TransPartClassTypeID] [int] NULL,
	[PartUsageCardID] [int] NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[StationName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StraightTime] [float] NULL,
	[OverTime] [float] NULL,
	[DoubleTime] [float] NULL,
	[ShiftDiffTime] [float] NULL,
	[CanCreatePartUsageCard] [bit] NULL,
 CONSTRAINT [TimeCard_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_TimeCard_AdjustedByID]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TimeCard_AdjustedByID] ON [dbo].[TimeCard]
(
	[AdjustedByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TimeCard_StationID]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TimeCard_StationID] ON [dbo].[TimeCard]
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TimeCard_StatusID]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TimeCard_StatusID] ON [dbo].[TimeCard]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Index_TimeCard_StatusName]    Script Date: 5/15/2018 12:06:59 PM ******/
CREATE NONCLUSTERED INDEX [Index_TimeCard_StatusName] ON [dbo].[TimeCard]
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
