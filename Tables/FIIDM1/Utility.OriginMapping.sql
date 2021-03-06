/****** Object:  Table [Utility].[OriginMapping]    Script Date: 5/15/2018 11:59:58 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Utility].[OriginMapping](
	[SourceCustomerType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatchingOrigin] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_OriginMapping]    Script Date: 5/15/2018 11:59:58 AM ******/
CREATE CLUSTERED INDEX [IX_OriginMapping] ON [Utility].[OriginMapping]
(
	[SourceCustomerType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
