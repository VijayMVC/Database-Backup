/****** Object:  Table [dbo].[units_conversions]    Script Date: 5/15/2018 12:04:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[units_conversions](
	[from_unit_id] [int] NOT NULL,
	[to_unit_id] [int] NOT NULL,
	[conversion_rate] [decimal](20, 10) NULL,
 CONSTRAINT [PK_units_conversions_from_unit_id] PRIMARY KEY CLUSTERED 
(
	[from_unit_id] ASC,
	[to_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[units_conversions] ADD  DEFAULT (NULL) FOR [conversion_rate]
GO
