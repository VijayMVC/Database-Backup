/****** Object:  Table [dbo].[SSISPackageGroupNames]    Script Date: 5/15/2018 12:04:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SSISPackageGroupNames](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[PackageName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_SSISPackageGroupNames_LogID] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[SSISPackageGroupNames]  WITH CHECK ADD  CONSTRAINT [FK_SSISPackageGroupNames_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupNames] ([GroupID])
ON DELETE CASCADE
ALTER TABLE [dbo].[SSISPackageGroupNames] CHECK CONSTRAINT [FK_SSISPackageGroupNames_GroupID]
GO
