/****** Object:  UserDefinedFunction [dbo].[MDate]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF


CREATE function [dbo].[MDate](@Year int, @Month int, @Day int)

  returns datetime

AS

  BEGIN

  declare @d datetime;

  set @d = dateadd(year,(@Year - 1753),'1/1/1753');

  set @d = dateadd(month,@Month - 1,@d);

  return dateadd(day,@Day - 1,@d)

END






GO
