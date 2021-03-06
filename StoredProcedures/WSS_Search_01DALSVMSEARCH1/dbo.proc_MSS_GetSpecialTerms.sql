/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSpecialTerms]    Script Date: 5/15/2018 12:13:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetSpecialTerms
@ConsumerGpId NVARCHAR(50),
@View int,
@Filter int,
@Value NVARCHAR(2048) = null  AS
declare @strCommand nvarchar(4000)
declare @viewCommand nvarchar(100)
declare @filterCommand nvarchar (1000)
declare @orderby nvarchar(100)
set @strCommand = '
SELECT a.SpecialTermId, Term, Definition, Contact, StartDate, EndDate, ReviewDate FROM MSSSpecialTerms a join MSSConsumerGpLink b 
ON a.SpecialTermID = b.SpecialTermId
WHERE ConsumerGpId = @consumerGpId '
set @orderby = 'ORDER BY EndDate ASC'
set @viewCommand = ''
set @filterCommand = ''
if (@View = 1)
BEGIN
 SET @viewCommand = 'and EndDate < GETUTCDATE()'
END
else if (@View = 2)
BEGIN
 SET @viewCommand = 'and ReviewDate < GETUTCDATE()'
 set @orderby = 'ORDER BY ReviewDate ASC'
END
if(@Value is not null)
BEGIN
if (@Filter = 0)
BEGIN
 SET @filterCommand = ' and Term like @value '
END
if (@Filter = 1)
BEGIN
 SET @filterCommand = ' and a.SpecialTermId in   
(SELECT SpecialTermId from MSSSynonyms a where Term like @value and Term not in 
(SELECT Term from MSSSpecialTerms b where a.SpecialTermId = b.SpecialTermId) ) '
END
if (@Filter = 2)
BEGIN
 SET @filterCommand = ' and a.SpecialTermId in   
(SELECT SpecialTermId FROM MSSBestBets a join MSSBestBetsLink b 
ON a.BestBetId = b.BestBetId where Title like @value ) '
END
if (@Filter = 3)
BEGIN
 SET @filterCommand = ' and a.SpecialTermId in   
(SELECT SpecialTermId FROM MSSBestBets a join MSSBestBetsLink b 
ON a.BestBetId = b.BestBetId where Url like @value ) '
END
if (@Filter = 4)
BEGIN
 SET @filterCommand = ' and Contact like @value '
END
END
SET @strCommand = @strCommand + @viewCommand + @filterCommand + @orderby
EXEC sp_executesql @strCommand, N'@consumerGpId NVARCHAR(50), @value NVARCHAR(2048)', @consumerGpId = @ConsumerGpId, @value = @Value

GO
