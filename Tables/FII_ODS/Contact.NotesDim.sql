/****** Object:  Table [Contact].[NotesDim]    Script Date: 5/15/2018 11:59:24 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[NotesDim](
	[NotesKey] [int] IDENTITY(1,1) NOT NULL,
	[NotesName] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_NotesKey] PRIMARY KEY CLUSTERED 
(
	[NotesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [Contact].[NotesDim] ADD  CONSTRAINT [DF_Notes_IsValid]  DEFAULT ((0)) FOR [IsValid]
GO
