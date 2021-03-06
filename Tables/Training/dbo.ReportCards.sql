/****** Object:  Table [dbo].[ReportCards]    Script Date: 5/15/2018 12:07:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReportCards](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MasterClass] [int] NULL,
	[Template] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ReportCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ReportCards]  WITH CHECK ADD  CONSTRAINT [FK_ReportCards_MasterClasses] FOREIGN KEY([MasterClass])
REFERENCES [dbo].[MasterClasses] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[ReportCards] CHECK CONSTRAINT [FK_ReportCards_MasterClasses]
GO
