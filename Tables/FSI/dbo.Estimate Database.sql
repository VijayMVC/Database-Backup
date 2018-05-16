/****** Object:  Table [dbo].[Estimate Database]    Script Date: 5/15/2018 12:00:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Estimate Database](
	[ORDERID] [int] NOT NULL,
	[STOREID] [int] NOT NULL,
	[PRICINGRATIO] [float] NULL,
	[DESCRIPTION] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMBERITEMS] [int] NULL,
	[CUSTOMERID] [int] NULL,
	[CONTACTID] [int] NULL,
	[ORDERERFIRSTNAME] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERLASTNAME] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERTITLE] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERPAREACODE] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERPHONENUMBER] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERPHONEEXTENTION] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERFAREACODE] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERERFAXNUMBER] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDEREREMAILADDRESS] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SALEPERSONID] [int] NULL,
	[ENTEREDBYID] [int] NULL,
	[STATUS] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ONHOLD] [bit] NULL,
	[ESTIMATEDATE] [datetime] NULL,
	[ORDERDATE] [datetime] NULL,
	[DUEDATE] [datetime] NULL,
	[DUETIME] [datetime] NULL,
	[BUILTDATE] [datetime] NULL,
	[VOIDDATE] [datetime] NULL,
	[PICKEDUPDATE] [datetime] NULL,
	[WRITEOFFDATE] [datetime] NULL,
	[HOLDDATE] [datetime] NULL,
	[LASTINTERESTDATE] [datetime] NULL,
	[CLOSEDDATE] [datetime] NULL,
	[SIGNSALES] [float] NULL,
	[AVISALES] [float] NULL,
	[INSTALLSALES] [float] NULL,
	[PRODUCTIONCAT1SALES] [float] NULL,
	[PRODUCTIONCAT2SALES] [float] NULL,
	[PRODUCTIONCAT3SALES] [float] NULL,
	[ITEMSTOTAL] [float] NULL,
	[SALESSUBTOTAL] [float] NULL,
	[TAXABLEAMOUNT] [float] NULL,
	[TAXEXEMPTAMOUNT] [float] NULL,
	[TAXEXEMPTAMOUNTCALCULATED] [float] NULL,
	[TAXEXEMPTAMOUNTOVERRIDDEN] [bit] NULL,
	[TAXEXEMPT] [bit] NULL,
	[TAXIDNUMBER] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TAXREGIONID] [int] NULL,
	[COUNTYSALESTAX] [float] NULL,
	[COUNTYSALESTAXRATE] [float] NULL,
	[STATESALESTAX] [float] NULL,
	[STATESALESTAXRATE] [float] NULL,
	[TAXTOTAL] [float] NULL,
	[PROMOTIONID] [int] NULL,
	[DISCOUNTAMOUNT] [float] NULL,
	[DISCOUNTPERCENT] [float] NULL,
	[SHIPPINGCHARGE] [float] NULL,
	[INTERESTAMOUNT] [float] NULL,
	[SALESTOTAL] [float] NULL,
	[TOTALPAYMENTS] [float] NULL,
	[BALANCEOUTSTANDING] [float] NULL,
	[WRITEOFFAMOUNT] [float] NULL,
	[PURCHASEORDERNUMBER] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SHIPPINGADDRESS] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DISPOSITIONONCOMPLETION] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDERNOTES] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INSTALLNOTES] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ESTIMATENUMBER] [int] NULL,
	[ITEMSDISCOUNTTOTAL] [float] NULL,
	[DISCOUNTTOTAL] [float] NULL,
	[DISPOSITIONONCOMPLETIONID] [int] NULL,
	[CUSTOMERNAME] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SHIPPINGTAXABLE] [bit] NULL,
	[ROYALTYRATE] [float] NULL,
	[JOBBOX] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PROOFDATE] [datetime] NULL,
	[LINEITEMSOVERRIDEN] [bit] NULL,
	[ORDERORIGINID] [int] NULL,
	[ISLOCKED] [bit] NULL,
	[LOCKEDDATE] [datetime] NULL,
	[LOCKEDUSER] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MODIFIEDDATE] [datetime] NULL,
	[MODIFIEDUSER] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVOICEID] [int] NULL,
	[ESTGREETINGINTRO] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ESTGREETINGINTROOV] [bit] NULL,
	[ESTGREETINGBODY] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ESTGREETINGCLOSING] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ESTGREETINGCLOSINGOV] [bit] NULL,
	[SYS_DI] [datetime] NULL,
	[SYS_DU] [datetime] NULL,
	[ZW_FRANCHISE_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[ConvertedDate] [datetime] NULL,
	[ConvertedOrderID] [int] NULL,
	[LostDate] [datetime] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [ESTIMATEDATABASE_CNSTR_PK] PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC,
	[STOREID] ASC,
	[ZW_FRANCHISE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_Estimate Database_ZW_FRANCHISE_ID_includes]    Script Date: 5/15/2018 12:00:49 PM ******/
CREATE NONCLUSTERED INDEX [idx_Estimate Database_ZW_FRANCHISE_ID_includes] ON [dbo].[Estimate Database]
(
	[ZW_FRANCHISE_ID] ASC
)
INCLUDE ( 	[ORDERID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
