/****** Object:  Table [dbo].[sysutility_ucp_supported_object_types_internal]    Script Date: 5/15/2018 12:03:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_supported_object_types_internal](
	[object_type] [int] NOT NULL,
	[object_name] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_sysutility_ucp_supported_object_types_internal] PRIMARY KEY CLUSTERED 
(
	[object_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
