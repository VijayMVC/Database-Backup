/****** Object:  Table [dbo].[CONTACT2_jsn_20140102_a]    Script Date: 5/15/2018 12:01:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CONTACT2_jsn_20140102_a](
	[ACCOUNTNO] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CALLBACKON] [datetime] NULL,
	[CALLBACKAT] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CALLBKFREQ] [smallint] NULL,
	[LASTCONTON] [datetime] NULL,
	[LASTCONTAT] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASTATMPON] [datetime] NULL,
	[LASTATMPAT] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MEETDATEON] [datetime] NULL,
	[MEETTIMEAT] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMMENTS] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PREVRESULT] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NEXTACTION] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACTIONON] [datetime] NULL,
	[CLOSEDATE] [datetime] NULL,
	[U2YRACT01] [float] NULL,
	[U2YRACT02] [float] NULL,
	[U2YRACT03] [float] NULL,
	[U2YRACT04] [float] NULL,
	[U2YRACT05] [float] NULL,
	[U2YRACT06] [float] NULL,
	[U2YRACT07] [float] NULL,
	[U2YRACT08] [float] NULL,
	[U2YRACT09] [float] NULL,
	[U2YRACT10] [float] NULL,
	[U2YRACT11] [float] NULL,
	[U2YRACT12] [float] NULL,
	[U3MILEBUSI] [varchar](56) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UA1_TERR] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UACK_REC] [datetime] NULL,
	[UACTTOT00] [float] NULL,
	[UACTTOT01] [float] NULL,
	[UACTTOT02] [float] NULL,
	[UACTTOT03] [float] NULL,
	[UACTTOT04] [float] NULL,
	[UACTTOT05] [float] NULL,
	[UACTTOT06] [float] NULL,
	[UACTTOT07] [float] NULL,
	[UACTTOT08] [float] NULL,
	[UACTTOT09] [float] NULL,
	[UACTTOT10] [float] NULL,
	[UACTUALS01] [float] NULL,
	[UACTUALS02] [float] NULL,
	[UACTUALS03] [float] NULL,
	[UACTUALS04] [float] NULL,
	[UACTUALS05] [float] NULL,
	[UACTUALS06] [float] NULL,
	[UACTUALS07] [float] NULL,
	[UACTUALS08] [float] NULL,
	[UACTUALS09] [float] NULL,
	[UACTUALS10] [float] NULL,
	[UACTUALS11] [float] NULL,
	[UACTUALS12] [float] NULL,
	[UADV_FEE] [float] NULL,
	[UAFSADDINS] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UAIRPORT] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UASP] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UASPLINK] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UBEDATE] [datetime] NULL,
	[UBREAKEVEN] [float] NULL,
	[UCOOPDATE] [datetime] NULL,
	[UDECOR] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UDEVAGRDAT] [datetime] NULL,
	[UDEVEXPDAT] [datetime] NULL,
	[UDEVFEE] [int] NULL,
	[UEMC] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UEQUIPMNT] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UEQUIPPACK] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UEXCTERBEG] [datetime] NULL,
	[UEXCTEREND] [datetime] NULL,
	[UEXECEXDT] [datetime] NULL,
	[UEXECEXLVL] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFAC] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFBCGMID] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFBCTITLE] [varchar](55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFDIFPDT] [datetime] NULL,
	[UFDPPRREC] [datetime] NULL,
	[UFDTOURDT] [datetime] NULL,
	[UFDTOURSCH] [datetime] NULL,
	[UFDUFOCDT] [datetime] NULL,
	[UFIN_RECD] [datetime] NULL,
	[UFIN_STMTS] [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFIN_TYPE] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFMM] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFOC_DATE] [datetime] NULL,
	[UFOC_STATE] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFRANAGRDT] [datetime] NULL,
	[UFRANFEE] [float] NULL,
	[UFRANTERMD] [datetime] NULL,
	[UFRANTERMR] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UFRANTRMYR] [smallint] NULL,
	[UFSTML] [datetime] NULL,
	[UFSTMLCHDT] [datetime] NULL,
	[UFSTMLENDT] [datetime] NULL,
	[UFSTMLTYPE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UGENLIAEXP] [datetime] NULL,
	[UGENLIALIM] [float] NULL,
	[UINQUIRY] [datetime] NULL,
	[ULANDLORD] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ULASTACT01] [float] NULL,
	[ULASTACT02] [float] NULL,
	[ULASTACT03] [float] NULL,
	[ULASTACT04] [float] NULL,
	[ULASTACT05] [float] NULL,
	[ULASTACT06] [float] NULL,
	[ULASTACT07] [float] NULL,
	[ULASTACT08] [float] NULL,
	[ULASTACT09] [float] NULL,
	[ULASTACT10] [float] NULL,
	[ULASTACT11] [float] NULL,
	[ULASTACT12] [float] NULL,
	[ULASTCONV] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ULASTVISIT] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ULOCTYPE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ULUMINATE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UMEDSUBGR] [float] NULL,
	[UMEDSUBREM] [float] NULL,
	[UMENTOR] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UMKTGCATLG] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UMKTGCNTRY] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UNAC] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UNAPAGRDAT] [datetime] NULL,
	[UNAPAGRDT2] [datetime] NULL,
	[UNAPELECTR] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UNONAUTEXP] [datetime] NULL,
	[UNONAUTLIM] [float] NULL,
	[UOPSREGION] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UOTHERINS] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UOTHRINSEX] [datetime] NULL,
	[UOWNERCNT] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UOWNERTYPE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UPOSVER] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UPPC] [datetime] NULL,
	[UPPCTYPE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UPRICING] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UPT130PQ] [datetime] NULL,
	[UPT150S5] [datetime] NULL,
	[UPT160S6] [datetime] NULL,
	[UPT170V] [datetime] NULL,
	[UPT200NA] [datetime] NULL,
	[UPT210A] [datetime] NULL,
	[UPT220FA] [datetime] NULL,
	[UR1STREFA] [varchar](237) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UR1STREFBD] [datetime] NULL,
	[UR1STREFED] [datetime] NULL,
	[URECBYDATE] [datetime] NULL,
	[UREGION] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URESALEFEE] [float] NULL,
	[URESALEOPD] [datetime] NULL,
	[UROM] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UROYALTYF] [float] NULL,
	[UROYALTYPT] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URPM] [datetime] NULL,
	[USALESREP] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USDS] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF01] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF02] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF03] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF04] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF05] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF06] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF07] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF08] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF09] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USERDEF10] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHAREINT1] [float] NULL,
	[USHAREINT2] [float] NULL,
	[USHAREINT3] [float] NULL,
	[USHAREINT4] [float] NULL,
	[USHAREINT5] [float] NULL,
	[USHAREINT6] [float] NULL,
	[USHARINTN1] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHARINTN2] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHARINTN3] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHARINTN4] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHARINTN5] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHARINTN6] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USHPBYDATE] [datetime] NULL,
	[USPECPROV] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USTOREOPD] [datetime] NULL,
	[USTORETYPE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTAC] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTECH] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTRAFFICNT] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTRAINFEE] [float] NULL,
	[UTRANSAGRD] [datetime] NULL,
	[UTRANSFEE] [float] NULL,
	[UTSSUBGR] [float] NULL,
	[UTSSUBREM] [float] NULL,
	[UV1CLSSATT] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV1COMPBY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV1COMPDT] [datetime] NULL,
	[UV1RTYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV1SCHBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV1SCHDT] [datetime] NULL,
	[UV1SEM] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV1TYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV1WAIVREC] [datetime] NULL,
	[UV2CLSSATT] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV2COMPBY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV2COMPDT] [datetime] NULL,
	[UV2RTYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV2SCHBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV2SCHDT] [datetime] NULL,
	[UV2SEM] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV2TYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV2WAIVREC] [datetime] NULL,
	[UV3CLSSATT] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV3COMPBY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV3COMPDT] [datetime] NULL,
	[UV3RTYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV3SCHBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV3SCHDT] [datetime] NULL,
	[UV3SEM] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV3TYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV3WAIVREC] [datetime] NULL,
	[UV4CLSSATT] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV4COMPBY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV4COMPDT] [datetime] NULL,
	[UV4RTYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV4SCHBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV4SCHDT] [datetime] NULL,
	[UV4SEM] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV4TYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV4WAIVREC] [datetime] NULL,
	[UV5CLSSATT] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV5COMPBY] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV5COMPDT] [datetime] NULL,
	[UV5RTYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV5SCHBY] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV5SCHDT] [datetime] NULL,
	[UV5SEM] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV5TYPE] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UV5WAIVREC] [datetime] NULL,
	[UVISITEDON] [datetime] NULL,
	[UWEBNUMBER] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UWORKCOMP] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UWORKCOMPE] [datetime] NULL,
	[UYPPUBDATE] [datetime] NULL,
	[UZIP01] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP02] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP03] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP04] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP05] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP06] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP07] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP08] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP09] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP10] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP11] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP12] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP13] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP14] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP15] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP16] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP17] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP18] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP19] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UZIP20] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RECID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
