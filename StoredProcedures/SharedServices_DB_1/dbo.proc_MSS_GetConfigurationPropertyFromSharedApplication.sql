/****** Object:  StoredProcedure [dbo].[proc_MSS_GetConfigurationPropertyFromSharedApplication]    Script Date: 5/15/2018 12:11:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetConfigurationPropertyFromSharedApplication
(
    @Name NVARCHAR(64),
    @Value SQL_VARIANT OUTPUT 
)
AS
 SET @Value = NULL

 DECLARE @field NVARCHAR(4000)
 DECLARE @type NVARCHAR(100)
 DECLARE @realName NVARCHAR(64)
 DECLARE @iFieldEnd INT
 DECLARE @iType INT
 DECLARE @iValue INT
 DECLARE @iTypeEnd INT

 SET @realName = @Name
 IF @Name LIKE N'%\indexLocation'
   SET @realName = N'indexLocationsOnQueryServers'

 SELECT @field = SUBSTRING(ISNULL(LongXml, Xml), PATINDEX(N'%<field name=' + char(34) + @realName + char(34) + N'%', ISNULL(LongXml, Xml)), 4000)
 FROM   dbo.MIPObjects WITH(NOLOCK)
 WHERE  objectid = N'1DD1DB1D-8A07-4E27-9249-B7D328818FA2'

 IF (@field IS NULL) OR (LEN(@field) < 6) OR (SUBSTRING(@field, 1, 6) <> N'<field')
   RETURN

 SET @iValue = CHARINDEX(N'>', @field, LEN(N'<field name=' + char(34) + @realName + char(34)))
 SET @iType = CHARINDEX(N'type=' + char(34), @field, LEN(N'<field '))

 IF (@iValue IS NULL) OR (@iValue = 0) OR (@iType IS NULL) OR (@iType = 0)
   RETURN

 IF SUBSTRING(@field, @iValue - 1, 1) = N'/'
   RETURN

 SET @iValue = @iValue + 1
 SET @iType = @iType + LEN(N'type=' + char(34))

 SET @iFieldEnd = CHARINDEX(N'</field>', @field, @iValue)
 SET @iTypeEnd = CHARINDEX(char(34), @field, @iType)

 IF (@iFieldEnd IS NULL) OR (@iFieldEnd = 0) OR (@iTypeEnd IS NULL) OR (@iTypeEnd = 0)
   RETURN

 SET @Value = dbo.func_MSS_GetTypedConfigurationProperty(
         @realName,
         SUBSTRING(@field, @iType, @iTypeEnd - @iType),
         SUBSTRING(@field, @iValue, @iFieldEnd - @iValue))
 SET @type = SUBSTRING(@field, @iType, @iTypeEnd - @iType)

 IF (@Value IS NULL) OR (@realName <> N'indexLocationsOnQueryServers')
   RETURN

 SET @type = N'string'
 SET @Value = NULL

 DECLARE @serverName nvarchar(20)
 SET @serverName = LEFT(@Name, LEN(@Name) - 14)
 IF LEN(@serverName) = 0
   RETURN

 SET @iValue = CHARINDEX(N'<item>' + @serverName + char(9), @field, @iValue)

 IF (@iValue IS NULL) OR (@iValue = 0) OR (@iValue >= @iFieldEnd)
   RETURN

 SET @iValue = @iValue + LEN(N'<item>' + @serverName + char(9))

 DECLARE @iValueEnd INT
 SET @iValueEnd = CHARINDEX(N'</item>', @field, @iValue)

 IF (@iValueEnd IS NULL) OR (@iValueEnd = 0) OR (@iValueEnd >= @iFieldEnd)
   RETURN

 SET @Value = dbo.func_MSS_GetTypedConfigurationProperty(
         @Name,
         @type,
         SUBSTRING(@field, @iValue, @iValueEnd - @iValue))


GO
