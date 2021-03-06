/****** Object:  Table [dbo].[OrderNotes]    Script Date: 5/15/2018 12:02:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderNotes](
	[OrdHId] [int] NOT NULL,
	[OrdDId] [int] NOT NULL,
	[OrdNId] [int] NOT NULL,
	[OrdNType] [tinyint] NOT NULL,
	[OrdNMessage] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdNDate] [smalldatetime] NULL,
 CONSTRAINT [PK_OrderNotes] PRIMARY KEY CLUSTERED 
(
	[OrdHId] ASC,
	[OrdDId] ASC,
	[OrdNId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
