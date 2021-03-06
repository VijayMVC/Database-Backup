/****** Object:  Table [dbo].[xf_ip_match]    Script Date: 5/15/2018 12:00:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_ip_match](
	[ip] [nvarchar](43) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[match_type] [nvarchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[first_byte] [binary](1) NOT NULL,
	[start_range] [varbinary](16) NOT NULL,
	[end_range] [varbinary](16) NOT NULL,
 CONSTRAINT [PK_xf_ip_match_ip] PRIMARY KEY CLUSTERED 
(
	[ip] ASC,
	[match_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [start_range]    Script Date: 5/15/2018 12:00:23 PM ******/
CREATE NONCLUSTERED INDEX [start_range] ON [dbo].[xf_ip_match]
(
	[start_range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_ip_match] ADD  DEFAULT (N'banned') FOR [match_type]
GO
