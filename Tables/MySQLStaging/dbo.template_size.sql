/****** Object:  Table [dbo].[template_size]    Script Date: 5/15/2018 12:04:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[template_size](
	[template_size_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[dsol_template_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ecommerce_size_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_template_size_template_size_id] PRIMARY KEY CLUSTERED 
(
	[template_size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [dsol_template_size_fkey]    Script Date: 5/15/2018 12:04:32 PM ******/
CREATE NONCLUSTERED INDEX [dsol_template_size_fkey] ON [dbo].[template_size]
(
	[dsol_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [ecomm_size_template_fkey]    Script Date: 5/15/2018 12:04:32 PM ******/
CREATE NONCLUSTERED INDEX [ecomm_size_template_fkey] ON [dbo].[template_size]
(
	[ecommerce_size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[template_size] ADD  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[template_size] ADD  DEFAULT (NULL) FOR [created_by]
GO
