/****** Object:  Table [dbo].[MailingProfile]    Script Date: 5/15/2018 12:02:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MailingProfile](
	[MalPId] [int] NOT NULL,
	[MalPName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MalPTelemIncluded] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SicHId] [int] NULL,
 CONSTRAINT [PK_MailingProfile] PRIMARY KEY CLUSTERED 
(
	[MalPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
