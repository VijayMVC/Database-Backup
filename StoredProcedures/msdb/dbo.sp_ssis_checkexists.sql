/****** Object:  StoredProcedure [dbo].[sp_ssis_checkexists]    Script Date: 5/15/2018 12:10:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_ssis_checkexists]
  @name sysname,
  @folderid uniqueidentifier
AS
  SET NOCOUNT ON
  SELECT TOP 1 1 FROM sysssispackages WHERE [name] = @name AND [folderid] = @folderid
  RETURN 0    -- SUCCESS

GO
