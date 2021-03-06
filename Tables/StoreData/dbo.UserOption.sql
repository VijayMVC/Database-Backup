/****** Object:  Table [dbo].[UserOption]    Script Date: 5/15/2018 12:07:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[UserOption](
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
	[ParentClassTypeID] [int] NULL,
	[OptionName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OptionValue] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OptionMemo] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [UserOption_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Index_UserOption_OptionName]    Script Date: 5/15/2018 12:07:03 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserOption_OptionName] ON [dbo].[UserOption]
(
	[OptionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_UserOption_ParentID]    Script Date: 5/15/2018 12:07:03 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserOption_ParentID] ON [dbo].[UserOption]
(
	[ParentID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
