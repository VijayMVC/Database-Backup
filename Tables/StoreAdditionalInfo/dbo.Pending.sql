/****** Object:  Table [dbo].[Pending]    Script Date: 5/15/2018 12:06:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Pending](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[Activity] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date] [datetime] NULL,
	[Reference] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Time] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pending_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pending_Id] PRIMARY KEY CLUSTERED 
(
	[Pending_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Pending]  WITH CHECK ADD  CONSTRAINT [FK_Pending_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[Pending] CHECK CONSTRAINT [FK_Pending_StoreAdditionalInfo]
GO
