/****** Object:  Table [dbo].[sf_tr_jbs]    Script Date: 5/15/2018 12:02:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_tr_jbs](
	[trg_langs] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prjc_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
 CONSTRAINT [pk_sf_tr_jbs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
