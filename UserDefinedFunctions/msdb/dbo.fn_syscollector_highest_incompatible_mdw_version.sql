/****** Object:  UserDefinedFunction [dbo].[fn_syscollector_highest_incompatible_mdw_version]    Script Date: 5/15/2018 12:14:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [dbo].[fn_syscollector_highest_incompatible_mdw_version]()
RETURNS nvarchar(50)
BEGIN
    RETURN '10.00.1300.13'  -- CTP6
END

GO
