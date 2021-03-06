/****** Object:  Table [dbo].[SSISPackageLayout]    Script Date: 5/15/2018 12:04:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SSISPackageLayout](
	[LayoutID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PackageName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LayoutXML] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TasklistXML] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[DFLayoutXML] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__SSISPack__203586F50DAF0CB0] PRIMARY KEY CLUSTERED 
(
	[LayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_SSISPackageLayout_PackageID_PackageName]    Script Date: 5/15/2018 12:04:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_SSISPackageLayout_PackageID_PackageName] ON [dbo].[SSISPackageLayout]
(
	[PackageID] ASC,
	[PackageName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[SSISPackageLayout] ADD  CONSTRAINT [DF__SSISPacka__Creat__0F975522]  DEFAULT (getdate()) FOR [CreatedOn]
ALTER TABLE [dbo].[SSISPackageLayout] ADD  CONSTRAINT [DF__SSISPacka__LastU__108B795B]  DEFAULT (getdate()) FOR [LastUpdatedOn]
GO
