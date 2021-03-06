/****** Object:  Table [dbo].[calendar]    Script Date: 5/15/2018 12:03:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[calendar](
	[calendar_dt] [date] NOT NULL,
	[weekday_flg] [bit] NULL,
	[holiday_flg] [bit] NULL,
	[year_no] [smallint] NULL,
	[quarter_no] [smallint] NULL,
	[month_no] [smallint] NULL,
	[day_no] [smallint] NULL,
	[day_of_week_no] [smallint] NULL,
	[week_no] [smallint] NULL,
 CONSTRAINT [PK_calendar_calendar_dt] PRIMARY KEY CLUSTERED 
(
	[calendar_dt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [day_no]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [day_no] ON [dbo].[calendar]
(
	[day_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [day_of_week_no]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [day_of_week_no] ON [dbo].[calendar]
(
	[day_of_week_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [holiday_flg]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [holiday_flg] ON [dbo].[calendar]
(
	[holiday_flg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [month_no]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [month_no] ON [dbo].[calendar]
(
	[month_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [quarter_no]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [quarter_no] ON [dbo].[calendar]
(
	[quarter_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [week_no]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [week_no] ON [dbo].[calendar]
(
	[week_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [weekday_flg]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [weekday_flg] ON [dbo].[calendar]
(
	[weekday_flg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [year_no]    Script Date: 5/15/2018 12:03:58 PM ******/
CREATE NONCLUSTERED INDEX [year_no] ON [dbo].[calendar]
(
	[year_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__weekda__5812160E]  DEFAULT (NULL) FOR [weekday_flg]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__holida__59063A47]  DEFAULT (NULL) FOR [holiday_flg]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__year_n__59FA5E80]  DEFAULT (NULL) FOR [year_no]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__quarte__5AEE82B9]  DEFAULT (NULL) FOR [quarter_no]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__month___5BE2A6F2]  DEFAULT (NULL) FOR [month_no]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__day_no__5CD6CB2B]  DEFAULT (NULL) FOR [day_no]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__day_of__5DCAEF64]  DEFAULT (NULL) FOR [day_of_week_no]
ALTER TABLE [dbo].[calendar] ADD  CONSTRAINT [DF__calendar__week_n__5EBF139D]  DEFAULT (NULL) FOR [week_no]
GO
