/****** Object:  Table [dbo].[xf_smilie_category]    Script Date: 5/15/2018 12:00:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_smilie_category](
	[smilie_category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[display_order] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_smilie_category_smilie_category_id] PRIMARY KEY CLUSTERED 
(
	[smilie_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
