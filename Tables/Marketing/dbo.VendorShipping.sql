/****** Object:  Table [dbo].[VendorShipping]    Script Date: 5/15/2018 12:02:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[VendorShipping](
	[VndSId] [int] NOT NULL,
	[VndId] [int] NULL,
	[VndSType] [tinyint] NULL,
	[VndSDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndSVar1] [float] NULL,
	[VndSVar2] [float] NULL,
	[VndSVar3] [float] NULL,
 CONSTRAINT [PK_VendorShipping] PRIMARY KEY CLUSTERED 
(
	[VndSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
