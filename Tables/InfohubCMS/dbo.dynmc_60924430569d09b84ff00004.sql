/****** Object:  Table [dbo].[dynmc_60924430569d09b84ff00004]    Script Date: 5/15/2018 12:01:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[dynmc_60924430569d09b84ff00004](
	[id] [uniqueidentifier] NOT NULL,
	[username] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_avatar] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[summary] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[publication_date] [datetime] NULL,
	[pipe_id] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[owner_last_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[owner_first_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[owner_email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lnk] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lang_id] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[item_hash] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[expiration_date] [datetime] NULL,
	[content_type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_dynmc_60924430569d_83DBB4C2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[dynmc_60924430569d09b84ff00004]  WITH CHECK ADD  CONSTRAINT [ref_dynmc_60924430569_A15F24F1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_dynamic_type_base] ([id])
ON DELETE CASCADE
ALTER TABLE [dbo].[dynmc_60924430569d09b84ff00004] CHECK CONSTRAINT [ref_dynmc_60924430569_A15F24F1]
GO
