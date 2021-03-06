/****** Object:  UserDefinedFunction [dbo].[fnGetWhere]    Script Date: 5/15/2018 12:14:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON









-- =============================================
-- Author:		Matthew Wear
-- Create date: 8/28/2006
-- 
-- =============================================
CREATE FUNCTION [dbo].[fnGetWhere]
(
	@storeNumber int,
	@storeLower int,
	@storeUpper int,
	@dateLower datetime,
	@dateUpper datetime,
	@country varchar(50),
	@group varchar(50)
)
RETURNS varchar(MAX)
AS
BEGIN
	declare @where varchar(MAX)
	set @where = ' where '

	if(@storeNumber > 0)
	begin
		set @where = @where + ' cs.storeNumber = ' + cast(@storeNumber as varchar(50)) + ' and '
	end

	if(@storeLower > 0 AND @storeUpper > @storeLower)
	begin
		set @where = @where + ' cs.storeNumber between ' + cast(@storeLower as varchar(50)) + ' and ' + cast(@storeUpper as varchar(50)) + ' and '
	end
	
	if(@dateLower > '1/1/1800' AND @dateUpper > @dateLower)
	begin
		set @where =  @where + ' srp.EndDate between ''' + cast(@dateLower as varchar(50)) + ''' and ''' + cast(@dateUpper as varchar(50)) + ''' and '
	end

	if(@country != '')
	begin
		set @where = @where + ' cr.fullname = ''' + @country + ''' and '
	end

	set @where = @where + ' ''a'' = ''a'' '

	RETURN @where
END











GO
