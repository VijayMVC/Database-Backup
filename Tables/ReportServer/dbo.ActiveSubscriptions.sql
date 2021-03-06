/****** Object:  Table [dbo].[ActiveSubscriptions]    Script Date: 5/15/2018 12:04:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ActiveSubscriptions](
	[ActiveID] [uniqueidentifier] NOT NULL,
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[TotalNotifications] [int] NULL,
	[TotalSuccesses] [int] NOT NULL,
	[TotalFailures] [int] NOT NULL,
 CONSTRAINT [PK_ActiveSubscriptions] PRIMARY KEY CLUSTERED 
(
	[ActiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ActiveSubscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_ActiveSubscriptions_Subscriptions] FOREIGN KEY([SubscriptionID])
REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
ON DELETE CASCADE
ALTER TABLE [dbo].[ActiveSubscriptions] CHECK CONSTRAINT [FK_ActiveSubscriptions_Subscriptions]
GO
