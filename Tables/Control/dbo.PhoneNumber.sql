/****** Object:  Table [dbo].[PhoneNumber]    Script Date: 5/15/2018 11:58:53 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PhoneNumber](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[PhoneNumberTypeID] [int] NULL,
	[CountryCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AreaCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Extension] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormattedText] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumberIndex] [int] NULL,
	[PhoneNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PhoneNumber] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
