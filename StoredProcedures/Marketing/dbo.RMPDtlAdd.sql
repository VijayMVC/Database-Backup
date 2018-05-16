/****** Object:  StoredProcedure [dbo].[RMPDtlAdd]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.RMPDtlAdd
(
	@RMPHId int = NULL,
	@RMPDId int = NULL,
	@MatGHId int = NULL,
	@MatGHType tinyint = NULL,
	@MatGPrdId int = NULL,
	@MatGDMailDate smalldatetime = NULL
)
AS
INSERT INTO RMPDtl (RMPHId, RMPDId, MatGHId, MatGHType, MatGPrdId, MatGDMailDate)
 VALUES (@RMPHId, @RMPDId, @MatGHId, @MatGHType, @MatGPrdId, @MatGDMailDate);


GO
