/****** Object:  StoredProcedure [dbo].[Contact1ExtUpdate]    Script Date: 5/15/2018 12:10:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.Contact1ExtUpdate
(
	@Contact1ExtID int = NULL,
	@Contact1UWEBNUMBER int = NULL,
	@Contact1UWEBNUMBERFlag bit = NULL,
	@Contact1ExtAcceptChecks char(1) = NULL,
	@Contact1ExtAcceptChecksFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@Contact1UWEBNUMBERFlag Is Not NULL)
BEGIN
	IF (@Contact1UWEBNUMBER Is Not NULL)
		SET @SQL = @SQL + 'Contact1UWEBNUMBER=' + convert(varchar,@Contact1UWEBNUMBER) + ', ';
	ELSE
		SET @SQL = @SQL + 'Contact1UWEBNUMBER=NULL, ';
END
IF (@Contact1ExtAcceptChecksFlag Is Not NULL)
BEGIN
	IF (@Contact1ExtAcceptChecks Is Not NULL)
		SET @SQL = @SQL + 'Contact1ExtAcceptChecks=''' + @Contact1ExtAcceptChecks + ''', ';
	ELSE
		SET @SQL = @SQL + 'Contact1ExtAcceptChecks=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE Contact1Ext SET ' + Left(@SQL, Len(@SQL)-1) + ' Where Contact1ExtID = ' + convert(varchar,@Contact1ExtID) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
