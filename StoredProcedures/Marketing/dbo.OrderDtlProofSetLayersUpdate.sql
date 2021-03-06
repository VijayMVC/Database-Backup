/****** Object:  StoredProcedure [dbo].[OrderDtlProofSetLayersUpdate]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlProofSetLayersUpdate
(
	@PrfSId int = NULL,
	@PrfSIdFlag bit = NULL,
	@PrfLId int = NULL,
	@PrfLIdFlag bit = NULL,
	@OrdPSId int = NULL,
	@OrdPSLId int = NULL,
	@OrdPSLType tinyint = NULL,
	@OrdPSLTypeFlag bit = NULL,
	@OrdPSLOffId int = NULL,
	@OrdPSLOffIdFlag bit = NULL,
	@OrdPSLLock char(1) = NULL,
	@OrdPSLLockFlag bit = NULL,
	@OrdPSLCoordX1 int = NULL,
	@OrdPSLCoordX1Flag bit = NULL,
	@OrdPSLCoordY1 int = NULL,
	@OrdPSLCoordY1Flag bit = NULL,
	@OrdPSLCoordX2 int = NULL,
	@OrdPSLCoordX2Flag bit = NULL,
	@OrdPSLCoordY2 int = NULL,
	@OrdPSLCoordY2Flag bit = NULL,
	@OrdPSLRotation int = NULL,
	@OrdPSLRotationFlag bit = NULL,
	@OrdPSLImage varchar(50) = NULL,
	@OrdPSLImageFlag bit = NULL,
	@OrdPSLText text = NULL,
	@OrdPSLTextFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@PrfSIdFlag Is Not NULL)
BEGIN
	IF (@PrfSId Is Not NULL)
		SET @SQL = @SQL + 'PrfSId=' + convert(varchar,@PrfSId) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSId=NULL, ';
END
IF (@PrfLIdFlag Is Not NULL)
BEGIN
	IF (@PrfLId Is Not NULL)
		SET @SQL = @SQL + 'PrfLId=' + convert(varchar,@PrfLId) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfLId=NULL, ';
END
IF (@OrdPSLTypeFlag Is Not NULL)
BEGIN
	IF (@OrdPSLType Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLType=' + convert(varchar,@OrdPSLType) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLType=NULL, ';
END
IF (@OrdPSLOffIdFlag Is Not NULL)
BEGIN
	IF (@OrdPSLOffId Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLOffId=' + convert(varchar,@OrdPSLOffId) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLOffId=NULL, ';
END
IF (@OrdPSLLockFlag Is Not NULL)
BEGIN
	IF (@OrdPSLLock Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLLock=''' + @OrdPSLLock + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLLock=NULL, ';
END
IF (@OrdPSLCoordX1Flag Is Not NULL)
BEGIN
	IF (@OrdPSLCoordX1 Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLCoordX1=' + convert(varchar,@OrdPSLCoordX1) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLCoordX1=NULL, ';
END
IF (@OrdPSLCoordY1Flag Is Not NULL)
BEGIN
	IF (@OrdPSLCoordY1 Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLCoordY1=' + convert(varchar,@OrdPSLCoordY1) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLCoordY1=NULL, ';
END
IF (@OrdPSLCoordX2Flag Is Not NULL)
BEGIN
	IF (@OrdPSLCoordX2 Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLCoordX2=' + convert(varchar,@OrdPSLCoordX2) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLCoordX2=NULL, ';
END
IF (@OrdPSLCoordY2Flag Is Not NULL)
BEGIN
	IF (@OrdPSLCoordY2 Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLCoordY2=' + convert(varchar,@OrdPSLCoordY2) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLCoordY2=NULL, ';
END
IF (@OrdPSLRotationFlag Is Not NULL)
BEGIN
	IF (@OrdPSLRotation Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLRotation=' + convert(varchar,@OrdPSLRotation) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLRotation=NULL, ';
END
IF (@OrdPSLImageFlag Is Not NULL)
BEGIN
	IF (@OrdPSLImage Is Not NULL)
		SET @SQL = @SQL + 'OrdPSLImage=''' + @OrdPSLImage + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSLImage=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE OrderDtlProofSetLayers SET ' + Left(@SQL, Len(@SQL)-1) + ' Where OrdPSId = ' + convert(varchar,@OrdPSId) + ' AND OrdPSLId = ' + convert(varchar,@OrdPSLId) 
	EXEC(@SQL)
END
IF (@OrdPSLTextFlag Is Not NULL)
BEGIN
	DECLARE 	@ptrval0 binary(16)
	SELECT		@ptrval0 = TEXTPTR(OrdPSLText)
	FROM		OrderDtlProofSetLayers
	WHERE		OrdPSId = @OrdPSId AND OrdPSLId = @OrdPSLId
	WRITETEXT	OrderDtlProofSetLayers.OrdPSLText @ptrval0 @OrdPSLText
END


GO
