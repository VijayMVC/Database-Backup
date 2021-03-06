/****** Object:  Table [dbo].[ResourceStrings]    Script Date: 5/15/2018 11:58:42 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ResourceStrings](
	[Value] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RegionId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ResourceStrings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ResourceStrings]  WITH CHECK ADD  CONSTRAINT [FK_ResourceStrings_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
ALTER TABLE [dbo].[ResourceStrings] CHECK CONSTRAINT [FK_ResourceStrings_Regions]
ALTER TABLE [dbo].[ResourceStrings]  WITH CHECK ADD  CONSTRAINT [FK_ResourceStrings_Resources] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
ALTER TABLE [dbo].[ResourceStrings] CHECK CONSTRAINT [FK_ResourceStrings_Resources]
GO
