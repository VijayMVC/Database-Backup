/****** Object:  Table [dbo].[cor_persons_backup]    Script Date: 5/15/2018 11:58:36 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[cor_persons_backup](
	[PersonID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PersonType] [bigint] NOT NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[GoldMinePlacement] [bigint] NULL
) ON [PRIMARY]

GO
