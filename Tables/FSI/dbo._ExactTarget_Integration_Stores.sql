/****** Object:  Table [dbo].[_ExactTarget_Integration_Stores]    Script Date: 5/15/2018 12:00:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_ExactTarget_Integration_Stores](
	[zw_franchise_id] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[APIUserName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APIPassword] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FastMailDate] [datetime] NULL,
	[ListID] [int] NULL,
	[WebNumber] [int] NULL,
	[StoreNumber] [int] NULL,
	[LastSync] [datetime] NULL,
	[LastTransformation] [datetime] NULL,
	[ChannelMemberID] [int] NULL,
	[AccountID] [int] NULL,
	[LastSync2] [datetime] NULL,
	[OptOut2] [bit] NULL,
	[Delete_Flag] [bit] NULL,
	[Delete_Date] [datetime] NULL,
 CONSTRAINT [PK__ExactTarget_Integration_Stores] PRIMARY KEY CLUSTERED 
(
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[_ExactTarget_Integration_Stores] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_Stores_LastSync2]  DEFAULT ('1900-01-01') FOR [LastSync2]
ALTER TABLE [dbo].[_ExactTarget_Integration_Stores] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_Stores_OptOut2]  DEFAULT ((1)) FOR [OptOut2]
ALTER TABLE [dbo].[_ExactTarget_Integration_Stores] ADD  CONSTRAINT [DF__ExactTarget_Integration_Contacts_Stores_Delete_Flag]  DEFAULT ((0)) FOR [Delete_Flag]
GO
