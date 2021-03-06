/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 5/15/2018 12:11:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[CreateRole]
@RoleID as uniqueidentifier,
@RoleName as nvarchar(260),
@Description as nvarchar(512) = null,
@TaskMask as nvarchar(32),
@RoleFlags as tinyint
AS
INSERT INTO Roles
(RoleID, RoleName, Description, TaskMask, RoleFlags)
VALUES
(@RoleID, @RoleName, @Description, @TaskMask, @RoleFlags)

GO
