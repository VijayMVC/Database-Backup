/****** Object:  Table [dbo].[COR_PERSONS]    Script Date: 5/15/2018 11:58:36 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_PERSONS](
	[PersonID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PersonType] [bigint] NOT NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[GoldMinePlacement] [bigint] NULL,
 CONSTRAINT [PK_PERSONS] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
