/****** Object:  Table [dbo].[COR_STORES_PHONES_LINK]    Script Date: 5/15/2018 11:58:38 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_STORES_PHONES_LINK](
	[StoreID] [bigint] NOT NULL,
	[PhoneID] [bigint] NOT NULL,
 CONSTRAINT [PK_COR_STORES_PHONES_LINK] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
