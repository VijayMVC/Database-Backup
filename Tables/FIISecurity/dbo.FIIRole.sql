/****** Object:  Table [dbo].[FIIRole]    Script Date: 5/15/2018 12:00:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FIIRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SectionID] [int] NOT NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_fiiRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[FIIRole]  WITH CHECK ADD  CONSTRAINT [FK_fiiRole_fiiSection] FOREIGN KEY([SectionID])
REFERENCES [dbo].[FIISection] ([SectionID])
ALTER TABLE [dbo].[FIIRole] CHECK CONSTRAINT [FK_fiiRole_fiiSection]
GO
