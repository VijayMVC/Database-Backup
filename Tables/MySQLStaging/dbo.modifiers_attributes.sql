/****** Object:  Table [dbo].[modifiers_attributes]    Script Date: 5/15/2018 12:04:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[modifiers_attributes](
	[modifiers_attributes_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modifier_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modifiers_attributes_types_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[customer_question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[positioning] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[image_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[order_no] [smallint] NOT NULL,
	[default_value] [nvarchar](45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[required] [smallint] NOT NULL,
	[multiplier] [decimal](7, 2) NOT NULL,
	[base_multiplier] [smallint] NOT NULL,
	[base_price_method] [smallint] NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modified_on] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_modifiers_attributes_modifiers_attributes_id] PRIMARY KEY CLUSTERED 
(
	[modifiers_attributes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [image_id]    Script Date: 5/15/2018 12:04:20 PM ******/
CREATE NONCLUSTERED INDEX [image_id] ON [dbo].[modifiers_attributes]
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [modifier_id]    Script Date: 5/15/2018 12:04:20 PM ******/
CREATE NONCLUSTERED INDEX [modifier_id] ON [dbo].[modifiers_attributes]
(
	[modifier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [type]    Script Date: 5/15/2018 12:04:20 PM ******/
CREATE NONCLUSTERED INDEX [type] ON [dbo].[modifiers_attributes]
(
	[modifiers_attributes_types_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[modifiers_attributes] ADD  DEFAULT (NULL) FOR [image_id]
ALTER TABLE [dbo].[modifiers_attributes] ADD  DEFAULT (NULL) FOR [default_value]
ALTER TABLE [dbo].[modifiers_attributes] ADD  DEFAULT ((1.00)) FOR [multiplier]
ALTER TABLE [dbo].[modifiers_attributes] ADD  DEFAULT ((0)) FOR [base_multiplier]
ALTER TABLE [dbo].[modifiers_attributes] ADD  DEFAULT ((0)) FOR [base_price_method]
GO
