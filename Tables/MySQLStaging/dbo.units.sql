/****** Object:  Table [dbo].[units]    Script Date: 5/15/2018 12:04:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[units](
	[unit_id] [int] NOT NULL,
	[name] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[default] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[variations] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[unit_type_id] [smallint] NOT NULL,
 CONSTRAINT [PK_units_unit_id] PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
