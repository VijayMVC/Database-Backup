/****** Object:  Table [dbo].[ecommerce_size]    Script Date: 5/15/2018 12:04:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ecommerce_size](
	[ecommerce_size_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[unit_id] [int] NOT NULL,
	[height] [int] NULL,
	[width] [int] NULL,
	[height_pixels] [int] NULL,
	[width_pixels] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
 CONSTRAINT [PK_ecommerce_size_ecommerce_size_id] PRIMARY KEY CLUSTERED 
(
	[ecommerce_size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [units_ecommerce_sizes_fkey]    Script Date: 5/15/2018 12:04:04 PM ******/
CREATE NONCLUSTERED INDEX [units_ecommerce_sizes_fkey] ON [dbo].[ecommerce_size]
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
