/****** Object:  Table [dbo].[xf_content_type_field]    Script Date: 5/15/2018 12:00:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_content_type_field](
	[content_type] [varbinary](25) NOT NULL,
	[field_name] [varbinary](50) NOT NULL,
	[field_value] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_content_type_field_content_type] PRIMARY KEY CLUSTERED 
(
	[content_type] ASC,
	[field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [field_name]    Script Date: 5/15/2018 12:00:18 PM ******/
CREATE NONCLUSTERED INDEX [field_name] ON [dbo].[xf_content_type_field]
(
	[field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
