/****** Object:  Table [dbo].[SubsidyDtl]    Script Date: 5/15/2018 12:02:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SubsidyDtl](
	[SubDId] [int] NOT NULL,
	[SubHId] [int] NOT NULL,
	[SubDCalanderYear] [smallint] NOT NULL,
	[SubDDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubDUptoAmount] [real] NULL,
	[SubDAmount] [real] NOT NULL,
	[SubDRule1] [smallint] NULL,
	[SubDStoreField] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubDStoreValue] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubDDisable] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_SubsidyDtl] PRIMARY KEY CLUSTERED 
(
	[SubDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_SubsidyDtl]    Script Date: 5/15/2018 12:02:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubsidyDtl] ON [dbo].[SubsidyDtl]
(
	[SubDDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
