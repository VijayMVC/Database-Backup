/****** Object:  StoredProcedure [dbo].[sp_cycle_agent_errorlog]    Script Date: 5/15/2018 12:10:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE sp_cycle_agent_errorlog
AS
BEGIN
   exec sp_sqlagent_notify N'L'
END

GO
