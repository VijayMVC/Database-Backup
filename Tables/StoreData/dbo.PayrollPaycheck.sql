/****** Object:  Table [dbo].[PayrollPaycheck]    Script Date: 5/15/2018 12:06:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PayrollPaycheck](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[PayrollID] [int] NULL,
	[EmployeeID] [int] NULL,
	[EmployeePayrollType] [int] NULL,
	[StraightTime] [float] NULL,
	[OverTime] [float] NULL,
	[DoubleTime] [float] NULL,
	[ShiftDiffTime] [float] NULL,
	[SickPayTime] [float] NULL,
	[VacationTime] [float] NULL,
	[HolidayTime] [float] NULL,
	[TotalTime] [float] NULL,
	[BaseWages] [float] NULL,
	[CalcBaseWages] [float] NULL,
	[OVBaseWages] [float] NULL,
	[BaseWagesOV] [bit] NULL,
	[CommissionAmount] [float] NULL,
	[BonusAmount] [float] NULL,
	[GrossWages] [float] NULL,
	[OptionalEmployeeDeductionTotal] [float] NULL,
	[OptionalEmployerDeductionTotal] [float] NULL,
	[StandardEmployeeDeductionTotal] [float] NULL,
	[StandardEmployerDeductionTotal] [float] NULL,
	[BenefitTotal] [float] NULL,
	[AdvanceRepaymentAmount] [float] NULL,
	[AdvanceAmount] [float] NULL,
	[NetPay] [float] NULL,
	[IsVoided] [bit] NULL,
	[StraightTimeWage] [float] NULL,
	[OverTimeWage] [float] NULL,
	[DoubleTimeWage] [float] NULL,
	[ShiftDiffTimeWage] [float] NULL,
	[SickPayTimeWage] [float] NULL,
	[SickPayTimeEarned] [float] NULL,
	[VacationTimeWage] [float] NULL,
	[VacationTimeEarned] [float] NULL,
	[HolidayTimeWage] [float] NULL,
	[WorkersCompEquivalentWage] [float] NULL,
	[SickPayTimeWageEarned] [float] NULL,
	[VacationTimeWageEarned] [float] NULL,
	[CheckNumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProcessedDate] [datetime] NULL,
	[VoidDate] [datetime] NULL,
	[PayrollClassTypeID] [int] NULL,
	[WorkersCompEmployeeContribution] [float] NULL,
	[WorkersCompEmpContributionOV] [bit] NULL,
	[WorkersCompXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PayrollPaycheck_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
