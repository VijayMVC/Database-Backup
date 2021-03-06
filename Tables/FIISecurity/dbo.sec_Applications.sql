/****** Object:  Table [dbo].[sec_Applications]    Script Date: 5/15/2018 12:00:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sec_Applications](
	[application_id] [bigint] IDENTITY(15,1) NOT NULL,
	[description] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zee_access] [bit] NULL,
	[default_url] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [bit] NULL,
	[corp_access] [bit] NULL,
	[b2b_access] [bit] NULL,
	[test_url] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
