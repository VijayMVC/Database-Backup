/****** Object:  Table [dbo].[phone_types]    Script Date: 5/15/2018 12:04:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[phone_types](
	[phone_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[order] [int] NULL,
 CONSTRAINT [PK_phone_types_phone_type_id] PRIMARY KEY CLUSTERED 
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[phone_types] ADD  DEFAULT (NULL) FOR [name]
ALTER TABLE [dbo].[phone_types] ADD  DEFAULT (NULL) FOR [order]
GO
