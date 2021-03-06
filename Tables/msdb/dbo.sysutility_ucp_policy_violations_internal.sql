/****** Object:  Table [dbo].[sysutility_ucp_policy_violations_internal]    Script Date: 5/15/2018 12:03:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_policy_violations_internal](
	[health_policy_id] [int] NOT NULL,
	[policy_id] [int] NOT NULL,
	[policy_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[history_id] [int] NOT NULL,
	[detail_id] [int] NOT NULL,
	[target_query_expression] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[target_query_expression_with_id] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[execution_date] [datetime] NULL,
	[result] [int] NULL,
 CONSTRAINT [PK_sysutility_ucp_policy_violations_internal] PRIMARY KEY CLUSTERED 
(
	[policy_id] ASC,
	[history_id] ASC,
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
