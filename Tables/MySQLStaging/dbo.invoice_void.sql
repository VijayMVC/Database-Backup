/****** Object:  Table [dbo].[invoice_void]    Script Date: 5/15/2018 12:04:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[invoice_void](
	[invoice_void_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[invoice_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[subtotal] [decimal](12, 2) NOT NULL,
	[discount] [decimal](12, 2) NOT NULL,
	[taxes] [decimal](12, 2) NOT NULL,
	[amount_due] [decimal](12, 2) NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NOT NULL,
	[notes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[royalty_impact] [smallint] NOT NULL,
	[invoiced_on] [datetime2](0) NULL,
 CONSTRAINT [PK_invoice_void_invoice_void_id] PRIMARY KEY CLUSTERED 
(
	[invoice_void_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
