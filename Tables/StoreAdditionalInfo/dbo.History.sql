/****** Object:  Table [dbo].[History]    Script Date: 5/15/2018 12:06:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[History](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[Date] [datetime] NULL,
	[Activity] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reference] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Result] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Location] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ScheduledFor] [datetime] NULL,
	[CreatedBy] [datetime] NULL,
	[CompletedBy] [datetime] NULL,
	[Notes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[History_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_History_Id] PRIMARY KEY CLUSTERED 
(
	[History_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_StoreAdditionalInfo]
GO
