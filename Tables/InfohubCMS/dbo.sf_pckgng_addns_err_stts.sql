/****** Object:  Table [dbo].[sf_pckgng_addns_err_stts]    Script Date: 5/15/2018 12:01:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pckgng_addns_err_stts](
	[has_errs_on_strctr_imprt] [tinyint] NOT NULL,
	[has_errs_on_cntnt_imprt] [tinyint] NOT NULL,
	[has_errs_on_actvt] [tinyint] NOT NULL,
	[addn_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_pckgng_addns_err_stts] PRIMARY KEY CLUSTERED 
(
	[addn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
