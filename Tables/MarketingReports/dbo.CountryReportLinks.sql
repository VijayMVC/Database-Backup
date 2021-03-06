/****** Object:  Table [dbo].[CountryReportLinks]    Script Date: 5/15/2018 12:02:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CountryReportLinks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryReportID] [int] NOT NULL,
	[ReportLinkID] [int] NOT NULL,
 CONSTRAINT [PK_CountryReportLinks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_CountryReportLinks]    Script Date: 5/15/2018 12:02:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_CountryReportLinks] ON [dbo].[CountryReportLinks]
(
	[CountryReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_CountryReportLinks_1]    Script Date: 5/15/2018 12:02:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_CountryReportLinks_1] ON [dbo].[CountryReportLinks]
(
	[ReportLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_CountryReportLinks_2]    Script Date: 5/15/2018 12:02:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CountryReportLinks_2] ON [dbo].[CountryReportLinks]
(
	[CountryReportID] ASC,
	[ReportLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[CountryReportLinks]  WITH CHECK ADD  CONSTRAINT [FK_CountryReportLinks_CountryReports] FOREIGN KEY([CountryReportID])
REFERENCES [dbo].[CountryReports] ([ID])
ALTER TABLE [dbo].[CountryReportLinks] CHECK CONSTRAINT [FK_CountryReportLinks_CountryReports]
ALTER TABLE [dbo].[CountryReportLinks]  WITH CHECK ADD  CONSTRAINT [FK_CountryReportLinks_ReportLinks] FOREIGN KEY([ReportLinkID])
REFERENCES [dbo].[ReportLinks] ([ID])
ALTER TABLE [dbo].[CountryReportLinks] CHECK CONSTRAINT [FK_CountryReportLinks_ReportLinks]
GO
