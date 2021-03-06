/****** Object:  Table [dbo].[dm_legacy_store]    Script Date: 5/15/2018 12:04:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[dm_legacy_store](
	[legacy_store_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[web_number_txt] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[store_nm] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dm_legacy_store_legacy_store_id] PRIMARY KEY CLUSTERED 
(
	[legacy_store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[dm_legacy_store] ADD  DEFAULT (NULL) FOR [web_number_txt]
ALTER TABLE [dbo].[dm_legacy_store] ADD  DEFAULT (NULL) FOR [store_nm]
GO
