/****** Object:  Table [dbo].[FC_XML_Errors]    Script Date: 5/15/2018 12:00:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FC_XML_Errors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BadXML] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NOT NULL,
	[Fixed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[FC_XML_Errors] ADD  CONSTRAINT [DF_FC_XML_Errors_OLTP_InsertDate]  DEFAULT (getdate()) FOR [OLTP_InsertDate]
GO
