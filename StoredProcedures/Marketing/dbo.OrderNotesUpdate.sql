/****** Object:  StoredProcedure [dbo].[OrderNotesUpdate]    Script Date: 5/15/2018 12:10:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderNotesUpdate
(
	@OrdHId int = NULL,
	@OrdDId int = NULL,
	@OrdNId int = NULL,
	@OrdNType tinyint = NULL,
	@OrdNTypeFlag bit = NULL,
	@OrdNMessage text = NULL,
	@OrdNMessageFlag bit = NULL,
	@OrdNDate smalldatetime = NULL,
	@OrdNDateFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@OrdNTypeFlag Is Not NULL)
BEGIN
	IF (@OrdNType Is Not NULL)
		SET @SQL = @SQL + 'OrdNType=' + convert(varchar,@OrdNType) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdNType=NULL, ';
END
IF (@OrdNDateFlag Is Not NULL)
BEGIN
	IF (@OrdNDate Is Not NULL)
		SET @SQL = @SQL + 'OrdNDate=''' + convert(varchar,@OrdNDate) + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdNDate=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE OrderNotes SET ' + Left(@SQL, Len(@SQL)-1) + ' Where OrdHId = ' + convert(varchar,@OrdHId) + ' AND OrdDId = ' + convert(varchar,@OrdDId) + ' AND OrdNId = ' + convert(varchar,@OrdNId) 
	EXEC(@SQL)
END
IF (@OrdNMessageFlag Is Not NULL)
BEGIN
	DECLARE 	@ptrval0 binary(16)
	SELECT		@ptrval0 = TEXTPTR(OrdNMessage)
	FROM		OrderNotes
	WHERE		OrdHId = @OrdHId AND OrdDId = @OrdDId AND OrdNId = @OrdNId
	WRITETEXT	OrderNotes.OrdNMessage @ptrval0 @OrdNMessage
END


GO
