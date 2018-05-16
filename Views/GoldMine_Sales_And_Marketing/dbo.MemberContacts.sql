/****** Object:  View [dbo].[MemberContacts]    Script Date: 5/15/2018 12:13:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

/****** Object:  View dbo.MemberContacts    Script Date: 02/07/2002 11:30:26 AM ******/
CREATE VIEW [dbo].[MemberContacts]
AS select
	cs.accountno,
	cs.contact,
	cs.title,
	cs.phone,
	cs.fax,
	cse.contsupref as 'E-mail'
	from contsupp cs
	left join contsupp cse on (cs.accountno = cse.accountno and cse.rectype = 'P' and cse.contact = 'E-mail Address' and cse.linkacct = cs.recid)
	where cs.rectype = 'C'




GO
