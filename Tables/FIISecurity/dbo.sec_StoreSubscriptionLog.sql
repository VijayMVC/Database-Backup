/****** Object:  Table [dbo].[sec_StoreSubscriptionLog]    Script Date: 5/15/2018 12:00:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sec_StoreSubscriptionLog](
	[store_subsc_log_id] [bigint] NOT NULL,
	[store_number] [bigint] NULL,
	[state_id] [bigint] NULL,
	[date_transition] [datetime] NULL,
	[application_id] [bigint] NULL,
 CONSTRAINT [PK_SubscriptionStoreStateLog] PRIMARY KEY CLUSTERED 
(
	[store_subsc_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
