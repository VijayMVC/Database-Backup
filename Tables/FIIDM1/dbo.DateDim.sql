/****** Object:  Table [dbo].[DateDim]    Script Date: 5/15/2018 11:59:51 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DateDim](
	[DateKey] [int] NOT NULL,
	[ActualDate] [datetime] NOT NULL,
	[Year] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[QuarterName] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Month] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[DayofYear] [int] NOT NULL,
	[DayofMonth] [int] NOT NULL,
	[DayofWeek] [int] NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
	[Comments] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CalendarWeek] [int] NOT NULL,
	[CalendarMonth] [int] NOT NULL,
	[CalendarQtr] [int] NOT NULL,
	[BusinessYearWeek] [int] NOT NULL,
	[LeapYear] [tinyint] NOT NULL,
 CONSTRAINT [PK_DateDim] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_DateDim]    Script Date: 5/15/2018 11:59:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_DateDim] ON [dbo].[DateDim]
(
	[ActualDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
