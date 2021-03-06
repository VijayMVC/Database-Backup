/****** Object:  Table [dbo].[modifier_price_types]    Script Date: 5/15/2018 12:04:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[modifier_price_types](
	[price_type_id] [int] IDENTITY(4,1) NOT NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_modifier_price_types_price_type_id] PRIMARY KEY CLUSTERED 
(
	[price_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[modifier_price_types] ADD  DEFAULT (NULL) FOR [name]
GO
