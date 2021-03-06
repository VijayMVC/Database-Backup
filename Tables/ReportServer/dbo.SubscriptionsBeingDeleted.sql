/****** Object:  Table [dbo].[SubscriptionsBeingDeleted]    Script Date: 5/15/2018 12:05:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SubscriptionsBeingDeleted](
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SubscriptionsBeingDeleted] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
