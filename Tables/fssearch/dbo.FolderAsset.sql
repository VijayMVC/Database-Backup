/****** Object:  Table [dbo].[FolderAsset]    Script Date: 5/15/2018 12:01:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FolderAsset](
	[FolderAssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetID] [int] NOT NULL,
	[FolderID] [int] NOT NULL,
 CONSTRAINT [PK_NAPAsset] PRIMARY KEY CLUSTERED 
(
	[FolderAssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[FolderAsset]  WITH CHECK ADD  CONSTRAINT [FK_FolderAsset_Folder] FOREIGN KEY([FolderID])
REFERENCES [dbo].[Folder] ([FolderID])
ALTER TABLE [dbo].[FolderAsset] CHECK CONSTRAINT [FK_FolderAsset_Folder]
ALTER TABLE [dbo].[FolderAsset]  WITH CHECK ADD  CONSTRAINT [FK_FolderAsset_tblAssets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[tblAssets] ([ID])
ALTER TABLE [dbo].[FolderAsset] CHECK CONSTRAINT [FK_FolderAsset_tblAssets]
GO
