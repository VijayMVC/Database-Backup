/****** Object:  Table [dbo].[CourseContactLink]    Script Date: 5/15/2018 11:58:49 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CourseContactLink](
	[ID] [int] NOT NULL,
	[StoreID] [int] NULL,
	[ClassTypeID] [int] NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[AccountID] [int] NULL,
	[ContactID] [int] NULL,
	[OrderID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[TransDetailID] [int] NULL,
	[CourseEventID] [int] NULL,
	[StatusID] [int] NULL,
	[Enrolled] [bit] NULL,
	[CourseID] [int] NULL,
	[CourseTermID] [int] NULL,
	[StudentType] [int] NULL,
	[CanMakeUp] [bit] NULL,
	[MakeupEventID] [int] NULL,
	[SortIndex] [float] NULL,
	[ContractPeriodID] [int] NULL,
	[ContractStartDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CourseContactLink] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
