/****** Object:  Table [dbo].[note_type]    Script Date: 5/15/2018 12:04:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[note_type](
	[note_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type_name] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_note_type_note_type_id] PRIMARY KEY CLUSTERED 
(
	[note_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [note_type$note_type_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[note_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[note_type] ADD  DEFAULT (NULL) FOR [type_name]
GO
