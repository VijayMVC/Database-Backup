/****** Object:  Table [dbo].[RecurringActivity]    Script Date: 5/15/2018 11:58:55 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RecurringActivity](
	[ID] [int] NULL,
	[StoreID] [int] NULL,
	[ClassTypeID] [int] NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Interval] [int] NULL,
	[RecurrenceType] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndType] [int] NULL,
	[EndInterval] [int] NULL,
	[EndDate] [datetime] NULL,
	[LookAheadCount] [int] NULL,
	[TemplateID] [int] NULL,
	[LastScheduled] [datetime] NULL,
	[NextScheduled] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RecurringActivity] PRIMARY KEY CLUSTERED 
(
	[zw_pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
