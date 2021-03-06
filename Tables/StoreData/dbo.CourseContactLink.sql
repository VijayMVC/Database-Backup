/****** Object:  Table [dbo].[CourseContactLink]    Script Date: 5/15/2018 12:06:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CourseContactLink](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[AccountID] [int] NULL,
	[ContactID] [int] NULL,
	[OrderID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[TransDetailID] [int] NULL,
	[CourseEventID] [int] NULL,
	[StatusID] [int] NULL,
	[Enrolled] [bit] NULL,
	[CourseID] [int] NULL,
	[CourseTermID] [int] NULL,
	[StudentType] [int] NULL,
	[CanMakeUp] [bit] NULL,
	[MakeupEventID] [int] NULL,
	[SortIndex] [float] NULL,
	[ContractPeriodID] [int] NULL,
	[ContractStartDate] [datetime] NULL,
 CONSTRAINT [CourseContactLink_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_CourseContactLink_sidContactID]    Script Date: 5/15/2018 12:06:43 PM ******/
CREATE NONCLUSTERED INDEX [Index_CourseContactLink_sidContactID] ON [dbo].[CourseContactLink]
(
	[ContactID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_CourseContactLink_sidCourseEventID]    Script Date: 5/15/2018 12:06:43 PM ******/
CREATE NONCLUSTERED INDEX [Index_CourseContactLink_sidCourseEventID] ON [dbo].[CourseContactLink]
(
	[CourseEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_CourseContactLink_sidCourseID]    Script Date: 5/15/2018 12:06:43 PM ******/
CREATE NONCLUSTERED INDEX [Index_CourseContactLink_sidCourseID] ON [dbo].[CourseContactLink]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_CourseContactLink_sidCourseTermID]    Script Date: 5/15/2018 12:06:43 PM ******/
CREATE NONCLUSTERED INDEX [Index_CourseContactLink_sidCourseTermID] ON [dbo].[CourseContactLink]
(
	[CourseTermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_CourseContactLink_sidTransDetailID]    Script Date: 5/15/2018 12:06:43 PM ******/
CREATE NONCLUSTERED INDEX [Index_CourseContactLink_sidTransDetailID] ON [dbo].[CourseContactLink]
(
	[TransDetailID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
