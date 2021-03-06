/****** Object:  Table [dbo].[CenterSetting]    Script Date: 5/15/2018 12:09:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CenterSetting](
	[CenterSettingId] [bigint] IDENTITY(1,1) NOT NULL,
	[WebNumber] [int] NULL,
	[DaysToKeepJobs] [int] NULL,
	[EmailText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowEmployeeAccess] [bit] NULL,
	[DefaultContact] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Signature] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RowVersion] [timestamp] NOT NULL,
	[AllowDownload] [bit] NOT NULL,
	[CCEmail] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShowWatermark] [bit] NOT NULL,
	[ShowAvancedVersion] [bit] NOT NULL,
	[TermsFirst] [bit] NOT NULL,
	[SendEmailForEveryProof] [bit] NOT NULL,
	[DefaultDisplayName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FastsignsCenter_Id] PRIMARY KEY CLUSTERED 
(
	[CenterSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [_dta_index_CenterSetting_33_1072722874__K2_3_9987]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_CenterSetting_33_1072722874__K2_3_9987] ON [dbo].[CenterSetting]
(
	[WebNumber] ASC
)
INCLUDE ( 	[DaysToKeepJobs]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [_dta_index_CenterSetting_33_1072722874__K2_K1_3_8341]    Script Date: 5/15/2018 12:09:01 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_CenterSetting_33_1072722874__K2_K1_3_8341] ON [dbo].[CenterSetting]
(
	[WebNumber] ASC,
	[CenterSettingId] ASC
)
INCLUDE ( 	[DaysToKeepJobs]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[CenterSetting] ADD  CONSTRAINT [DF_CenterSetting_AllowDownload]  DEFAULT ((0)) FOR [AllowDownload]
ALTER TABLE [dbo].[CenterSetting] ADD  CONSTRAINT [DF_CenterSetting_ShowWatermark]  DEFAULT ((0)) FOR [ShowWatermark]
ALTER TABLE [dbo].[CenterSetting] ADD  CONSTRAINT [DF_CenterSetting_ShowAvancedVersion]  DEFAULT ((0)) FOR [ShowAvancedVersion]
ALTER TABLE [dbo].[CenterSetting] ADD  CONSTRAINT [DF_CenterSetting_TermsFirst]  DEFAULT ((1)) FOR [TermsFirst]
ALTER TABLE [dbo].[CenterSetting] ADD  DEFAULT ('0') FOR [SendEmailForEveryProof]
GO
