/****** Object:  StoredProcedure [dbo].[proc_MSS_GetAllBestBets]    Script Date: 5/15/2018 12:11:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetAllBestBets
@ConsumerGpId NVARCHAR(50),
@Filter int,
@Value NVARCHAR(2048) = null  AS 

declare @strCommand nvarchar(4000)
declare @filterCommand nvarchar (1000)

set @filterCommand = ''
set @strCommand = 'SELECT a.BestBetId, Title, Url, Description FROM MSSBestBets a join MSSBBConsumerGpLink b 
ON a.BestBetId = b.BestBetID
WHERE ConsumerGpId = @ConsumerGpId '

if(@Value is not null)
BEGIN
if (@Filter = 0)
BEGIN
 SET @filterCommand = ' and Title like @value '
END
if (@Filter = 1)
BEGIN
 SET @filterCommand = ' and Url like @value '
END
if (@Filter = 2)
BEGIN
 SET @filterCommand = ' and (Title like @value OR Url like @value) '
END
END

SET @strCommand = @strCommand + @filterCommand + 'order by a.Title'

EXEC sp_executesql @strCommand, N'@consumerGpId NVARCHAR(50), @value NVARCHAR(2048)', @consumerGpId = @ConsumerGpId, @value = @Value


GO
