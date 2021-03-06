/****** Object:  Table [dbo].[Tracks]    Script Date: 5/15/2018 12:06:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Tracks](
	[StoreAdditionalInfo_Id] [bigint] NOT NULL,
	[process] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lastEvent] [datetime] NULL,
	[NextEvent] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[trigger] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[action] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tracks_Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tracks_Id] PRIMARY KEY CLUSTERED 
(
	[Tracks_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_StoreAdditionalInfo] FOREIGN KEY([StoreAdditionalInfo_Id])
REFERENCES [dbo].[StoreAdditionalInfo] ([StoreAdditionalInfo_Id])
ALTER TABLE [dbo].[Tracks] CHECK CONSTRAINT [FK_Tracks_StoreAdditionalInfo]
GO
