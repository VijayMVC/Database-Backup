/****** Object:  Table [dbo].[EmailActivity]    Script Date: 5/15/2018 12:06:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EmailActivity](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[Recipients] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CC] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BCC] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sender] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Body] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Attachments] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipmentItemID] [int] NULL,
	[ShipmentItemClassTypeID] [int] NULL,
 CONSTRAINT [EmailActivity_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
