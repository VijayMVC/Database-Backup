/****** Object:  Table [dbo].[menu_transactions]    Script Date: 5/15/2018 12:04:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[menu_transactions](
	[menu_transactions_id] [int] IDENTITY(6,1) NOT NULL,
	[menu_group_items_id] [bigint] NOT NULL,
	[module] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[action] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_menu_transactions_menu_transactions_id] PRIMARY KEY CLUSTERED 
(
	[menu_transactions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[menu_transactions] ADD  DEFAULT (NULL) FOR [module]
ALTER TABLE [dbo].[menu_transactions] ADD  DEFAULT (NULL) FOR [action]
GO
