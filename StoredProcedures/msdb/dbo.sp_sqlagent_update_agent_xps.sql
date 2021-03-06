/****** Object:  StoredProcedure [dbo].[sp_sqlagent_update_agent_xps]    Script Date: 5/15/2018 12:10:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sp_sqlagent_update_agent_xps
  @new_value        bit = 1  -- the new value for the "Agent XPs" configuration option.
AS
BEGIN
  declare @agent_enabled bit 
  declare @show_advanced bit 
  
  select @show_advanced = cast(value_in_use as bit) 
    from sys.configurations 
    where name = N'show advanced options' 
  
  select @agent_enabled = cast(value_in_use as bit) 
    from sys.configurations 
    where name = N'Agent XPs' 
    
  if @new_value <> @agent_enabled 
  begin 
    if 1 <> @show_advanced 
    begin 
      exec sys.sp_configure @configname = N'show advanced options', @configvalue = 1 
      reconfigure with override 
    end 
    
    exec sys.sp_configure @configname = N'Agent XPs', @configvalue = @new_value 
    reconfigure with override 
    if 1 <> @show_advanced 
    begin 
      exec sys.sp_configure @configname = N'show advanced options', @configvalue = 0 
      reconfigure with override 
    end 
  end
END

GO
