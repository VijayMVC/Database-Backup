/****** Object:  Table [dbo].[SubClasses]    Script Date: 5/15/2018 12:07:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SubClasses](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MasterClass] [int] NULL,
	[StartDate] [datetime] NULL,
	[StartTime] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EndTime] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agenda] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Place] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Active] [bit] NULL,
	[RegistrationCloseDate] [datetime] NULL,
	[MaxStudents] [int] NULL,
	[CancellationPolicy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_SubClasses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[SubClasses] ADD  CONSTRAINT [DF_Subclasses_CancellationPolicy]  DEFAULT ('24 hours') FOR [CancellationPolicy]
ALTER TABLE [dbo].[SubClasses]  WITH CHECK ADD  CONSTRAINT [FK_SubClasses_MasterClasses] FOREIGN KEY([MasterClass])
REFERENCES [dbo].[MasterClasses] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[SubClasses] CHECK CONSTRAINT [FK_SubClasses_MasterClasses]
GO
