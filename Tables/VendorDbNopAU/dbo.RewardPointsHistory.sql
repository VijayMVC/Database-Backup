/****** Object:  Table [dbo].[RewardPointsHistory]    Script Date: 5/15/2018 12:07:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RewardPointsHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[PointsBalance] [int] NOT NULL,
	[UsedAmount] [decimal](18, 4) NOT NULL,
	[Message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UsedWithOrder_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[RewardPointsHistory]  WITH CHECK ADD  CONSTRAINT [RewardPointsHistory_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[RewardPointsHistory] CHECK CONSTRAINT [RewardPointsHistory_Customer]
ALTER TABLE [dbo].[RewardPointsHistory]  WITH CHECK ADD  CONSTRAINT [RewardPointsHistory_UsedWithOrder] FOREIGN KEY([UsedWithOrder_Id])
REFERENCES [dbo].[Order] ([Id])
ALTER TABLE [dbo].[RewardPointsHistory] CHECK CONSTRAINT [RewardPointsHistory_UsedWithOrder]
GO
