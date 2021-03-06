/****** Object:  Table [dbo].[CountryReports]    Script Date: 5/15/2018 12:02:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CountryReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReportID] [int] NOT NULL,
	[ReportLinkID] [int] NULL,
 CONSTRAINT [PK_CountryReports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_CountryReports]    Script Date: 5/15/2018 12:02:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CountryReports] ON [dbo].[CountryReports]
(
	[Country] ASC,
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[CountryReports]  WITH CHECK ADD  CONSTRAINT [FK_CountryReports_ReportLinks] FOREIGN KEY([ReportLinkID])
REFERENCES [dbo].[ReportLinks] ([ID])
ALTER TABLE [dbo].[CountryReports] CHECK CONSTRAINT [FK_CountryReports_ReportLinks]
ALTER TABLE [dbo].[CountryReports]  WITH CHECK ADD  CONSTRAINT [FK_CountryReports_Reports] FOREIGN KEY([ReportID])
REFERENCES [dbo].[Reports] ([ID])
ALTER TABLE [dbo].[CountryReports] CHECK CONSTRAINT [FK_CountryReports_Reports]
GO
