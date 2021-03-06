/****** Object:  Table [dbo].[Calendar]    Script Date: 5/15/2018 11:59:08 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Calendar](
	[CalendarDate] [date] NOT NULL,
	[CalendarYear] [int] NOT NULL,
	[CalendarMonth] [int] NOT NULL,
	[CalendarDay] [int] NOT NULL,
	[DayOfWeekName] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FirstDateOfWeek] [date] NOT NULL,
	[LastDateOfWeek] [date] NOT NULL,
	[FirstDateOfMonth] [date] NOT NULL,
	[LastDateOfMonth] [date] NOT NULL,
	[FirstDateOfQuarter] [date] NOT NULL,
	[LastDateOfQuarter] [date] NOT NULL,
	[FirstDateOfYear] [date] NOT NULL,
	[LastDateOfYear] [date] NOT NULL,
	[BusinessDay] [bit] NOT NULL,
	[NonBusinessDay] [bit] NOT NULL,
	[Weekend] [bit] NOT NULL,
	[Holiday] [bit] NOT NULL,
	[Weeklyday] [bit] NOT NULL,
	[CalendarDateDescription] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[CalendarDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
