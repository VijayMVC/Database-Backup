/****** Object:  Table [dbo].[RecurringPayment]    Script Date: 5/15/2018 12:07:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RecurringPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CycleLength] [int] NOT NULL,
	[CyclePeriodId] [int] NOT NULL,
	[TotalCycles] [int] NOT NULL,
	[StartDateUtc] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[InitialOrderId] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[RecurringPayment]  WITH CHECK ADD  CONSTRAINT [RecurringPayment_InitialOrder] FOREIGN KEY([InitialOrderId])
REFERENCES [dbo].[Order] ([Id])
ALTER TABLE [dbo].[RecurringPayment] CHECK CONSTRAINT [RecurringPayment_InitialOrder]
GO
