/****** Object:  Table [dbo].[Classes]    Script Date: 5/15/2018 12:06:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Classes](
	[Id] [uniqueidentifier] NOT NULL,
	[BaseClassId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_Classes_BaseClassId]    Script Date: 5/15/2018 12:06:06 PM ******/
CREATE CLUSTERED INDEX [IX_Classes_BaseClassId] ON [dbo].[Classes]
(
	[BaseClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Classes] FOREIGN KEY([BaseClassId])
REFERENCES [dbo].[Classes] ([Id])
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Classes]
GO
