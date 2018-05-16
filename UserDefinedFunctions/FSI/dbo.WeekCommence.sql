/****** Object:  UserDefinedFunction [dbo].[WeekCommence]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


create FUNCTION [dbo].[WeekCommence] (@MidWeekDate DateTime)
RETURNS DateTime AS

BEGIN
DECLARE @WeekCommence DateTime
	SET @WeekCommence = DateAdd(d, -((@@DATEFIRST + DatePart(dw, @MidWeekDate) -2) % 7), @MidWeekDate)
	RETURN @WeekCommence
END



GO
