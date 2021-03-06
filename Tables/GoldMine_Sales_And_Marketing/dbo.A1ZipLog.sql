/****** Object:  Table [dbo].[A1ZipLog]    Script Date: 5/15/2018 12:01:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[A1ZipLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDateTime] [datetime] NOT NULL,
	[ApproveDateTime] [datetime] NULL,
	[Approver] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxColumn] [int] NOT NULL,
 CONSTRAINT [PK_A1ZipLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[A1ZipLog] ADD  CONSTRAINT [DF_A1ZipLog_MaxColumn]  DEFAULT ((42)) FOR [MaxColumn]
GO
