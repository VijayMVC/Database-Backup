/****** Object:  Table [dbo].[SLS_ROYALTY_ALLOCATION]    Script Date: 5/15/2018 11:58:38 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SLS_ROYALTY_ALLOCATION](
	[AllocationID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RoyaltyReportID] [bigint] NULL,
	[RoyaltyAllocationType] [bigint] NULL,
	[AllocationAmount] [numeric](18, 2) NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[FIIPercent] [decimal](18, 4) NULL,
	[NACPercent] [decimal](18, 4) NULL,
	[FIIamount] [money] NULL,
	[NACamount] [money] NULL,
	[Comments] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_SLS_ROYALTY_REDUCTION] PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
