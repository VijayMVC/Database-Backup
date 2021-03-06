/****** Object:  Table [dbo].[call_types]    Script Date: 5/15/2018 12:03:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[call_types](
	[call_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_call_types_call_type_id] PRIMARY KEY CLUSTERED 
(
	[call_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[call_types] ADD  DEFAULT (N'') FOR [call_type_id]
ALTER TABLE [dbo].[call_types] ADD  DEFAULT (NULL) FOR [name]
GO
