/****** Object:  Table [dbo].[InfoHubStoreInfo]    Script Date: 5/15/2018 12:00:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[InfoHubStoreInfo](
	[fimFranchisee_Id] [numeric](20, 0) NULL,
	[referenceId] [bigint] NULL,
	[status] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchiseeName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[centerName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[areaID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[licenseNo] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reportPeriodStartDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fbc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[openingDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storeTypeId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[address2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[state] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zipcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storePhone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storePhoneExtn] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storeFax] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storeMobile] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storeEmail] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[contactTitle] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[contactFirstName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[contactLastName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone1Extn] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fax] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mobile] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[emailID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_fieldMarketingManager1041792295] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_closeDate1889257167] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_centerWebNumber1622712680] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_lastResaleDate1683749055] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_primaryCenterContact981995625] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_emailManagement2049101897] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_awardName1647528690] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_generalManagerkeyManagementEmployee493576182] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_typeOfContact630683838] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_useAlternateMail1505350934] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_title1405891574] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_firstName1230840476] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_lastName464804282] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_streetAddress475784584] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_city955226918] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_zippostCode46482933] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_stateprovince595807777] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_usa1440161415] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[_webInfo409558251] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[division] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[responseData_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
