/****** Object:  Table [dbo].[Sub_Materials]    Script Date: 5/15/2018 12:02:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Sub_Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varbinary](100) NULL,
 CONSTRAINT [PK_Sub_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
