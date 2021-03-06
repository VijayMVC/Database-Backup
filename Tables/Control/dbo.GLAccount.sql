/****** Object:  Table [dbo].[GLAccount]    Script Date: 5/15/2018 11:58:51 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GLAccount](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[AccountGroupID] [int] NULL,
	[AccountName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExportAccountName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExportAccountNumber] [int] NULL,
	[ExportGroupID] [int] NULL,
	[ConsolidateExport] [bit] NULL,
	[Depth] [int] NULL,
	[PathName1] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName2] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName3] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName4] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName5] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MasterGroup] [bit] NULL,
	[AllowSubGroups] [bit] NULL,
	[RequireOneMember] [bit] NULL,
	[MemberClassTypeID] [int] NULL,
	[ConsolidateSubAccounts] [bit] NULL,
	[SortIndex] [float] NULL,
	[ExportAccountDesc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NoExportToExternal] [bit] NULL,
	[AccountType] [int] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_GLAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
