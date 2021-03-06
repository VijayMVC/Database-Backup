/****** Object:  StoredProcedure [dbo].[MailingProfileUpdate]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MailingProfileUpdate
(
	@MalPId int = NULL,
	@MalPName varchar(50) = NULL,
	@MalPNameFlag bit = NULL,
	@MalPTelemIncluded char(1) = NULL,
	@MalPTelemIncludedFlag bit = NULL,
	@SicHId int = NULL,
	@SicHIdFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@MalPNameFlag Is Not NULL)
BEGIN
	IF (@MalPName Is Not NULL)
		SET @SQL = @SQL + 'MalPName=''' + @MalPName + ''', ';
	ELSE
		SET @SQL = @SQL + 'MalPName=NULL, ';
END
IF (@MalPTelemIncludedFlag Is Not NULL)
BEGIN
	IF (@MalPTelemIncluded Is Not NULL)
		SET @SQL = @SQL + 'MalPTelemIncluded=''' + @MalPTelemIncluded + ''', ';
	ELSE
		SET @SQL = @SQL + 'MalPTelemIncluded=NULL, ';
END
IF (@SicHIdFlag Is Not NULL)
BEGIN
	IF (@SicHId Is Not NULL)
		SET @SQL = @SQL + 'SicHId=' + convert(varchar,@SicHId) + ', ';
	ELSE
		SET @SQL = @SQL + 'SicHId=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MailingProfile SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MalPId = ' + convert(varchar,@MalPId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
