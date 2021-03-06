/****** Object:  Table [dbo].[MSSQLogQueryServer]    Script Date: 5/15/2018 12:05:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogQueryServer](
	[queryServerId] [int] IDENTITY(1,1) NOT NULL,
	[queryServer] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[lastReference] [datetime] NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_MSSQLogQueryServer]    Script Date: 5/15/2018 12:05:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSQLogQueryServer] ON [dbo].[MSSQLogQueryServer]
(
	[queryServer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
