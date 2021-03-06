/****** Object:  Table [dbo].[ConstDesc]    Script Date: 5/15/2018 12:02:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ConstDesc](
	[ConstGroupId] [int] NOT NULL,
	[ConstId] [int] NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ConstDesc] PRIMARY KEY CLUSTERED 
(
	[ConstGroupId] ASC,
	[ConstId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ConstDesc]  WITH CHECK ADD  CONSTRAINT [FK_ConstDesc_ConstDescGroup] FOREIGN KEY([ConstGroupId])
REFERENCES [dbo].[ConstDescGroup] ([ConstGroupId])
ALTER TABLE [dbo].[ConstDesc] CHECK CONSTRAINT [FK_ConstDesc_ConstDescGroup]
GO
