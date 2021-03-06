/****** Object:  Table [dbo].[FIIGroup_FIIRole]    Script Date: 5/15/2018 12:00:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FIIGroup_FIIRole](
	[Group_RoleID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Deny] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_sec_Group_Role] PRIMARY KEY CLUSTERED 
(
	[Group_RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[FIIGroup_FIIRole]  WITH CHECK ADD  CONSTRAINT [FK_fiiGroup_fiiRole_fiiGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[FIIGroup] ([GroupID])
ALTER TABLE [dbo].[FIIGroup_FIIRole] CHECK CONSTRAINT [FK_fiiGroup_fiiRole_fiiGroup]
ALTER TABLE [dbo].[FIIGroup_FIIRole]  WITH CHECK ADD  CONSTRAINT [FK_fiiGroup_fiiRole_fiiRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[FIIRole] ([RoleID])
ALTER TABLE [dbo].[FIIGroup_FIIRole] CHECK CONSTRAINT [FK_fiiGroup_fiiRole_fiiRole]
GO
