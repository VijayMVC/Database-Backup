/****** Object:  Table [dbo].[xf_moderator]    Script Date: 5/15/2018 12:00:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_moderator](
	[user_id] [bigint] NOT NULL,
	[is_super_moderator] [tinyint] NOT NULL,
	[moderator_permissions] [varbinary](max) NOT NULL,
	[extra_user_group_ids] [varbinary](255) NOT NULL,
 CONSTRAINT [PK_xf_moderator_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
