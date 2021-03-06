/****** Object:  Table [dbo].[xf_user_external_auth]    Script Date: 5/15/2018 12:00:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_external_auth](
	[user_id] [bigint] NOT NULL,
	[provider] [varbinary](25) NOT NULL,
	[provider_key] [varbinary](150) NOT NULL,
	[extra_data] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_user_external_auth_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[provider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_user_external_auth$provider] UNIQUE NONCLUSTERED 
(
	[provider] ASC,
	[provider_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
