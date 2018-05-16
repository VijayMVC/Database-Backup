/****** Object:  StoredProcedure [dbo].[ReadRoleProperties]    Script Date: 5/15/2018 12:10:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[ReadRoleProperties]
@RoleName as nvarchar(260)
AS 
SELECT Description, TaskMask, RoleFlags FROM Roles WHERE RoleName = @RoleName

GO
