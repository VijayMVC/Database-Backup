/****** Object:  Table [dbo].[spt_fallback_usg]    Script Date: 5/15/2018 12:02:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[spt_fallback_usg](
	[xserver_name] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[xdttm_ins] [datetime] NOT NULL,
	[xdttm_last_ins_upd] [datetime] NOT NULL,
	[xfallback_vstart] [int] NULL,
	[dbid] [smallint] NOT NULL,
	[segmap] [int] NOT NULL,
	[lstart] [int] NOT NULL,
	[sizepg] [int] NOT NULL,
	[vstart] [int] NOT NULL
) ON [PRIMARY]

GO
