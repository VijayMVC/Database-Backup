/****** Object:  Table [dbo].[Timeclock]    Script Date: 5/15/2018 12:00:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Timeclock](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[Date] [datetime] NULL,
	[Open] [bit] NULL,
	[TimeIn] [datetime] NULL,
	[TimeOut] [datetime] NULL,
	[LunchOut] [datetime] NULL,
	[LunchIn] [datetime] NULL,
	[Adjusted] [bit] NULL,
	[AdjustedDateTime] [datetime] NULL,
	[StraightTime] [float] NULL,
	[OverTime] [float] NULL,
	[Flags] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SpecialDay] [bit] NULL,
	[SpecialCode] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Timeclock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
