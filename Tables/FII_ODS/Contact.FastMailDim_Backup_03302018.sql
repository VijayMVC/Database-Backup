/****** Object:  Table [Contact].[FastMailDim_Backup_03302018]    Script Date: 5/15/2018 11:59:23 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[FastMailDim_Backup_03302018](
	[ContactKey] [int] NOT NULL,
	[CustomerKey] [int] NULL,
	[IS_OYB] [bit] NOT NULL,
	[IsModified] [bit] NOT NULL,
	[LastUpdated] [datetime] NOT NULL
) ON [PRIMARY]

GO
