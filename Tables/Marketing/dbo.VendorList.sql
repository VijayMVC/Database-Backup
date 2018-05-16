/****** Object:  Table [dbo].[VendorList]    Script Date: 5/15/2018 12:02:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[VendorList](
	[VndId] [int] NOT NULL,
	[VndLId] [int] NOT NULL,
	[VndLType] [tinyint] NOT NULL,
	[VndLDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndLValues] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndLDisable] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_VendorList] PRIMARY KEY CLUSTERED 
(
	[VndLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_VendorList]    Script Date: 5/15/2018 12:02:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_VendorList] ON [dbo].[VendorList]
(
	[VndId] ASC,
	[VndLType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
