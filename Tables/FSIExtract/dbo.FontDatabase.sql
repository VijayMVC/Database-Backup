/****** Object:  Table [dbo].[FontDatabase]    Script Date: 5/15/2018 12:01:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FontDatabase](
	[FontListID] [int] NOT NULL,
	[FontList] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fonts] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
