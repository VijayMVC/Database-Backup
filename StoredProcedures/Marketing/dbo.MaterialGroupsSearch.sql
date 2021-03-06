/****** Object:  StoredProcedure [dbo].[MaterialGroupsSearch]    Script Date: 5/15/2018 12:10:16 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE  PROCEDURE dbo.MaterialGroupsSearch
(
	@Filter  varchar(4000) = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL =  'SELECT MaterialGroupsHdr.*,MaterialGroupsDtl.MatGDSignUpDate,MaterialGroupsDtl.MatGDMailDate,MaterialGroupsDtl.MatGPrdId FROM MaterialGroupsHdr Left Join MaterialGroupsDtl on MaterialGroupsHdr.MatGHId=MaterialGroupsDtl.MatGHId';
	IF (@Filter Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Where  ' + @Filter;
	END
	IF (@OrderBy Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Order By  ' + @OrderBy;
	END
;
Print @SQL;
EXEC(@SQL);


GO
