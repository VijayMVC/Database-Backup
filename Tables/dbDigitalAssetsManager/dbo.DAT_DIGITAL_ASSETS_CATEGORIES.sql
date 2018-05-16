/****** Object:  Table [dbo].[DAT_DIGITAL_ASSETS_CATEGORIES]    Script Date: 5/15/2018 11:59:12 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DAT_DIGITAL_ASSETS_CATEGORIES](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[grouping] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateLastModified] [datetime] NULL,
 CONSTRAINT [PK_DAT_DIGITAL_ASSETS_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DAT_DIGITAL_ASSETS_CATEGORIES] ADD  CONSTRAINT [DF__DAT_DIGIT__DateC__77BFCB91]  DEFAULT (getdate()) FOR [DateCreated]
ALTER TABLE [dbo].[DAT_DIGITAL_ASSETS_CATEGORIES] ADD  CONSTRAINT [DF__DAT_DIGIT__DateL__78B3EFCA]  DEFAULT (getdate()) FOR [DateLastModified]
GO
