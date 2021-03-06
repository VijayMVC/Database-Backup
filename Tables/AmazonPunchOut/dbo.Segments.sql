/****** Object:  Table [dbo].[Segments]    Script Date: 5/15/2018 11:58:44 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Segments](
	[SegmentIdentity] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Id] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemOut_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Segments] PRIMARY KEY CLUSTERED 
(
	[SegmentIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_ItemOut_Id]    Script Date: 5/15/2018 11:58:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemOut_Id] ON [dbo].[Segments]
(
	[ItemOut_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Segments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Segments_dbo.ItemOuts_ItemOut_Id] FOREIGN KEY([ItemOut_Id])
REFERENCES [dbo].[ItemOuts] ([Id])
ALTER TABLE [dbo].[Segments] CHECK CONSTRAINT [FK_dbo.Segments_dbo.ItemOuts_ItemOut_Id]
GO
