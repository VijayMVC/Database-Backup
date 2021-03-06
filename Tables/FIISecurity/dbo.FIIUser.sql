/****** Object:  Table [dbo].[FIIUser]    Script Date: 5/15/2018 12:00:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FIIUser](
	[UserID] [int] IDENTITY(1000001,1) NOT NULL,
	[UserName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[UserTypeID] [int] NULL,
	[Active] [bit] NULL,
	[RowVersion] [timestamp] NULL,
	[Deleted] [bit] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangeDate] [datetime] NULL,
	[IsADUser] [bit] NULL,
 CONSTRAINT [PK_fiiUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_FIIUser_25_14623095__K2_K1_3_4_5_6_7_8_9_10_11_12_13_14]    Script Date: 5/15/2018 12:00:03 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_FIIUser_25_14623095__K2_K1_3_4_5_6_7_8_9_10_11_12_13_14] ON [dbo].[FIIUser]
(
	[UserName] ASC,
	[UserID] ASC
)
INCLUDE ( 	[Password],
	[FirstName],
	[LastName],
	[Email],
	[CreatedDate],
	[ModifiedDate],
	[UserTypeID],
	[Active],
	[RowVersion],
	[Deleted],
	[LastLoginDate],
	[LastPasswordChangeDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_fiiUser]    Script Date: 5/15/2018 12:00:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_fiiUser] ON [dbo].[FIIUser]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[FIIUser] ADD  CONSTRAINT [DF_FIIUser_Active]  DEFAULT ((1)) FOR [Active]
ALTER TABLE [dbo].[FIIUser] ADD  CONSTRAINT [DF_FIIUser_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
