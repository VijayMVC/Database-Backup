/****** Object:  StoredProcedure [dbo].[MaterialGroupsDtlDelete]    Script Date: 5/15/2018 12:10:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsDtlDelete
(
	@MatGHId int,
	@MatGPrdId int,
	@MatGDMailDate smalldatetime
)
AS
	DELETE FROM MaterialGroupsDtl WHERE MatGHId=@MatGHId AND MatGPrdId=@MatGPrdId AND MatGDMailDate=@MatGDMailDate;
RETURN @@Rowcount;


GO
