/****** Object:  Table [dbo].[sf_prs_criteria_group]    Script Date: 5/15/2018 12:01:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_prs_criteria_group](
	[sf_prs_criteria_group_id] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_prs_criteria_group] PRIMARY KEY CLUSTERED 
(
	[sf_prs_criteria_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
