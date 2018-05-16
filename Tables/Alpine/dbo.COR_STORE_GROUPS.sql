/****** Object:  Table [dbo].[COR_STORE_GROUPS]    Script Date: 5/15/2018 11:58:37 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_STORE_GROUPS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreGroupID] [bigint] NOT NULL,
	[StoreID] [bigint] NOT NULL,
 CONSTRAINT [PK_COR_STORE_GROUPS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
