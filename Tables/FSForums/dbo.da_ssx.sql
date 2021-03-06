/****** Object:  Table [dbo].[da_ssx]    Script Date: 5/15/2018 12:00:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[da_ssx](
	[rule_id] [bigint] IDENTITY(1,1) NOT NULL,
	[scheme] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[host] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[path] [varbinary](max) NOT NULL,
	[query] [varbinary](max) NOT NULL,
	[browser] [varbinary](max) NOT NULL,
	[user_group_ids] [varbinary](max) NOT NULL,
	[user_ids] [varbinary](max) NOT NULL,
	[ip_ids] [varbinary](max) NOT NULL,
	[style_ids] [varbinary](max) NOT NULL,
	[order_value] [bigint] NOT NULL,
 CONSTRAINT [PK_da_ssx_rule_id] PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [da_ssx$rule_id] UNIQUE NONCLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
