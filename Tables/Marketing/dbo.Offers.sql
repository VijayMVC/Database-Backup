/****** Object:  Table [dbo].[Offers]    Script Date: 5/15/2018 12:02:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Offers](
	[OffId] [int] NOT NULL,
	[OffType] [tinyint] NOT NULL,
	[OffName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OffImage] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OffDisabled] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[OffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
