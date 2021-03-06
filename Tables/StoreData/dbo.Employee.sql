/****** Object:  Table [dbo].[Employee]    Script Date: 5/15/2018 12:06:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Employee](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Position] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MainPhoneNumberID] [int] NULL,
	[MainFaxNumberID] [int] NULL,
	[AddressID] [int] NULL,
	[Birthdate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[Department] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeStatus] [int] NULL,
	[IsSalesperson] [bit] NULL,
	[IsWorkerResource] [bit] NULL,
	[ReportsToID] [int] NULL,
	[TaxNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [int] NULL,
	[PricingLevel] [float] NULL,
	[DiscountLevel] [float] NULL,
	[GroupID] [int] NULL,
	[ShowOnTimeClock] [bit] NULL,
	[ShowOnActivityManager] [bit] NULL,
	[PricingLevelID] [int] NULL,
	[CommissionPlanID] [int] NULL,
	[ReportTemplateID] [int] NULL,
	[ReportTemplateStoreID] [int] NULL,
	[MailAddressID] [int] NULL,
	[IsTaxNumEncrypt] [bit] NULL,
	[SignatureID] [int] NULL,
	[PerImageID] [int] NULL,
	[QPHomeListID] [int] NULL,
	[QPHomeListStoreID] [int] NULL,
	[QPTransListID] [int] NULL,
	[QPTransListStoreID] [int] NULL,
	[QPServiceListID] [int] NULL,
	[QPServiceListStoreID] [int] NULL,
	[ShowOnLineItems] [bit] NULL,
	[PrimaryNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriNumberTypeID] [int] NULL,
	[PriNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecNumberTypeID] [int] NULL,
	[SecNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsInstructor] [bit] NULL,
	[DefaultHomeScreen] [int] NULL,
	[ThirdNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ThirdNumberTypeID] [int] NULL,
	[ThirdNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatusID] [int] NULL,
	[StatusClassTypeID] [int] NULL,
	[StatusText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncludeInPayroll] [bit] NULL,
	[PayFrequency] [int] NULL,
	[PayRollType] [int] NULL,
	[StraightTimeRate] [float] NULL,
	[OverTimeRate] [float] NULL,
	[DoubleTimeRate] [float] NULL,
	[ShiftDiffRate] [float] NULL,
	[TimeCardsReqd] [bit] NULL,
	[LastRaiseDate] [datetime] NULL,
	[AnnualSalary] [float] NULL,
	[DefaultWageExpenseAccountID] [int] NULL,
	[DefaultWorkersCompID] [int] NULL,
	[TrackPTO] [bit] NULL,
	[EnableVacationPTO] [bit] NULL,
	[EnableSickPTO] [bit] NULL,
	[EnableHolidayPTO] [bit] NULL,
	[VacationPTOID] [int] NULL,
	[SickPTOID] [int] NULL,
	[HolidayPTOID] [int] NULL,
	[AllowAdvances] [bit] NULL,
	[AdvanceCurrentBalance] [float] NULL,
	[AdvanceAccrualAccountID] [int] NULL,
	[AdvanceLastRepaymentDate] [datetime] NULL,
	[AdvanceLastDate] [datetime] NULL,
	[AdvanceRepaymentAmount] [float] NULL,
	[AdvanceEstRepaymentDate] [datetime] NULL,
	[MaritalStatus] [int] NULL,
	[HoursWorkedPerYear] [float] NULL,
	[HoursWorkedPerYearOV] [bit] NULL,
	[IDNumber] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EncryptedTaxNumber] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[W2FirstName] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[W2MiddleName] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[W2LastName] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SUTADeductionID] [int] NULL,
	[TaxNumEncryptVersion] [int] NULL,
	[RecievesActualPaycheck] [bit] NULL,
	[SpecialPaycheckNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [Employee_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_Employee_AddressID]    Script Date: 5/15/2018 12:06:45 PM ******/
CREATE NONCLUSTERED INDEX [Index_Employee_AddressID] ON [dbo].[Employee]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Employee_MainPhoneNumberID]    Script Date: 5/15/2018 12:06:45 PM ******/
CREATE NONCLUSTERED INDEX [Index_Employee_MainPhoneNumberID] ON [dbo].[Employee]
(
	[MainPhoneNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Employee_ReportsToID]    Script Date: 5/15/2018 12:06:45 PM ******/
CREATE NONCLUSTERED INDEX [Index_Employee_ReportsToID] ON [dbo].[Employee]
(
	[ReportsToID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Employee_siEmployee_StatusID]    Script Date: 5/15/2018 12:06:45 PM ******/
CREATE NONCLUSTERED INDEX [Index_Employee_siEmployee_StatusID] ON [dbo].[Employee]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Indexes_Employee]    Script Date: 5/15/2018 12:06:45 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Employee] ON [dbo].[Employee]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
