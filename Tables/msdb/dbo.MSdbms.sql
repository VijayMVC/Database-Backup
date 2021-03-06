/****** Object:  Table [dbo].[MSdbms]    Script Date: 5/15/2018 12:02:59 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSdbms](
	[dbms_id] [int] IDENTITY(1,1) NOT NULL,
	[dbms] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[version] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_MSdbms] PRIMARY KEY CLUSTERED 
(
	[dbms_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
