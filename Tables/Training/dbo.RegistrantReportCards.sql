/****** Object:  Table [dbo].[RegistrantReportCards]    Script Date: 5/15/2018 12:07:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RegistrantReportCards](
	[RegistrantID] [int] NOT NULL,
	[ReportCard] [int] NOT NULL,
	[ReportID] [int] NOT NULL,
	[Complete] [bit] NULL,
 CONSTRAINT [PK_RegistrantReportCards] PRIMARY KEY CLUSTERED 
(
	[RegistrantID] ASC,
	[ReportCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[RegistrantReportCards]  WITH CHECK ADD  CONSTRAINT [FK_RegistrantReportCards_Registrants] FOREIGN KEY([RegistrantID])
REFERENCES [dbo].[Registrants] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[RegistrantReportCards] CHECK CONSTRAINT [FK_RegistrantReportCards_Registrants]
ALTER TABLE [dbo].[RegistrantReportCards]  WITH CHECK ADD  CONSTRAINT [FK_RegistrantReportCards_ReportCards] FOREIGN KEY([ReportCard])
REFERENCES [dbo].[ReportCards] ([ID])
ON UPDATE CASCADE
ALTER TABLE [dbo].[RegistrantReportCards] CHECK CONSTRAINT [FK_RegistrantReportCards_ReportCards]
GO
