/****** Object:  Table [dbo].[ANLHit]    Script Date: 5/15/2018 12:05:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ANLHit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayId] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
	[UserId] [int] NULL,
	[ReferrerResourceId] [int] NULL,
 CONSTRAINT [PK_ANLHit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ANLHitDayIdResourceId]    Script Date: 5/15/2018 12:05:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_ANLHitDayIdResourceId] ON [dbo].[ANLHit]
(
	[DayId] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_ANLHitResourceIdReferrerResourceIdDayId]    Script Date: 5/15/2018 12:05:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_ANLHitResourceIdReferrerResourceIdDayId] ON [dbo].[ANLHit]
(
	[ResourceId] ASC,
	[ReferrerResourceId] ASC,
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
