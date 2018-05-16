/****** Object:  StoredProcedure [dbo].[proc_MSS_ContainsManagedPropertyAlias]    Script Date: 5/15/2018 12:13:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ContainsManagedPropertyAlias
@PID int,
@alias nvarchar(2048),
@found bit Output
as
if exists (Select * from MSSManagedPropAliases where pid = @PID and alias = @alias )
select bit = 1
else
select  bit = 0

GO
