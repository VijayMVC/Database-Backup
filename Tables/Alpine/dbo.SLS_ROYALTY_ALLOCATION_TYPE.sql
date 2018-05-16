/****** Object:  Table [dbo].[SLS_ROYALTY_ALLOCATION_TYPE]    Script Date: 5/15/2018 11:58:39 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SLS_ROYALTY_ALLOCATION_TYPE](
	[RoyaltyAllocationType] [bigint] NOT NULL,
	[Name] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FIIPercent] [decimal](18, 4) NULL,
	[NACPercent] [decimal](18, 4) NULL,
	[KeyboardShortcut] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
 CONSTRAINT [PK_SLS_ROYALTY_REDUCTION_TYPE] PRIMARY KEY CLUSTERED 
(
	[RoyaltyAllocationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
