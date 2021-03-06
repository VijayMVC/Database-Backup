/****** Object:  Table [dbo].[COR_PERSON_DATES]    Script Date: 5/15/2018 11:58:35 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_PERSON_DATES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[PersonStatusType] [bigint] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
 CONSTRAINT [PK_COR_PERSON_DATES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
