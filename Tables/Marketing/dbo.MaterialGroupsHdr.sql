/****** Object:  Table [dbo].[MaterialGroupsHdr]    Script Date: 5/15/2018 12:02:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MaterialGroupsHdr](
	[MatGHId] [int] NOT NULL,
	[MatGHType] [tinyint] NOT NULL,
	[MatGHName] [varchar](125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatGHDesc] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatGHSignUpDate] [smalldatetime] NULL,
	[MatGHImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatGHDisplayType] [tinyint] NULL,
	[MatGHMalPId] [int] NULL,
	[MatGHSignUpDeadline] [smallint] NULL,
	[MatGHUploadDBDeadline] [smallint] NULL,
	[MatGHCreditCardValidation] [smallint] NULL,
	[MatGHPlanSignUpDeadline] [smallint] NULL,
	[MatGHMailingType] [tinyint] NULL,
 CONSTRAINT [PK_ScheduledMailings] PRIMARY KEY CLUSTERED 
(
	[MatGHId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
