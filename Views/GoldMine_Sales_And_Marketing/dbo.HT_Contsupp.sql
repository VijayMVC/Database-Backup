/****** Object:  View [dbo].[HT_Contsupp]    Script Date: 5/15/2018 12:13:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE VIEW [dbo].[HT_Contsupp]
AS
select
	cs.accountno,
	cs.contact,
	cs.contsupref
	from contsupp cs
	where cs.rectype = 'C' and cs.contsupref not in ('Landlord')




GO
