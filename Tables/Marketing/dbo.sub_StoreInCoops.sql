/****** Object:  Table [dbo].[sub_StoreInCoops]    Script Date: 5/15/2018 12:02:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sub_StoreInCoops](
	[CoopID] [int] NOT NULL,
	[WebNumber] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[RemovedOn] [datetime] NULL,
	[AddedOn] [datetime] NULL,
 CONSTRAINT [PK_sub_CoOpStores] PRIMARY KEY CLUSTERED 
(
	[CoopID] ASC,
	[WebNumber] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sub_StoreInCoops] ADD  CONSTRAINT [DF_sub_StoreInCoops_AddedOn]  DEFAULT (1 / 1 / 2005) FOR [AddedOn]
GO
