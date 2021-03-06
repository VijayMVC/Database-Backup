/****** Object:  Table [dbo].[HistoryAttachment]    Script Date: 5/15/2018 12:06:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[HistoryAttachment](
	[History_Id] [bigint] NOT NULL,
	[FileName] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HistoryAttachment_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HistoryAttachment_Id] PRIMARY KEY CLUSTERED 
(
	[HistoryAttachment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[HistoryAttachment]  WITH CHECK ADD  CONSTRAINT [FK_HistoryAttachment_History] FOREIGN KEY([History_Id])
REFERENCES [dbo].[History] ([History_Id])
ALTER TABLE [dbo].[HistoryAttachment] CHECK CONSTRAINT [FK_HistoryAttachment_History]
GO
