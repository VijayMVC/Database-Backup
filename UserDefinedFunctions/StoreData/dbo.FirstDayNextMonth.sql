/****** Object:  UserDefinedFunction [dbo].[FirstDayNextMonth]    Script Date: 5/15/2018 12:15:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION FirstDayNextMonth (
	-- Add the parameters for the function here
	@CurrentDate datetime
)
RETURNS datetime
AS
BEGIN
	
	DECLARE @Result datetime;
	Declare @Month int;
	Declare @Year int;

	Set @Month = Month(@CurrentDate) + 1;
	Set @Year = Year(@CurrentDate);

	if @Month > 12 
	begin
		set @Month = 1;
		set @Year = @Year + 1;
	end

	set @Result = Cast(Cast(@month as Varchar(2))+'/1/'+Cast(@Year as Varchar(4)) as DateTime);

	RETURN @Result

END

GO
