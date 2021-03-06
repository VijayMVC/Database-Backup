/****** Object:  Table [internal].[data_type_mapping]    Script Date: 5/15/2018 12:06:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [internal].[data_type_mapping](
	[mapping_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ssis_data_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sql_data_type] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Data_Type_Mapping] PRIMARY KEY CLUSTERED 
(
	[mapping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_data_type_mapping] UNIQUE NONCLUSTERED 
(
	[ssis_data_type] ASC,
	[sql_data_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
