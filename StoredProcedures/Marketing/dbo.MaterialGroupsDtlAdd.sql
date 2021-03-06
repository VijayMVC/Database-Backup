/****** Object:  StoredProcedure [dbo].[MaterialGroupsDtlAdd]    Script Date: 5/15/2018 12:10:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsDtlAdd
(
	@MatGHId int = NULL,
	@MatGPrdId int = NULL,
	@MatGDMailDate smalldatetime = NULL,
	@MatGDSignUpDate smalldatetime = NULL,
	@MatGDImage varchar(50) = NULL,
	@MatGDDisplayType tinyint = NULL,
	@MatGDMalPId int = NULL,
	@MatGDSignUpDeadline smallint = NULL,
	@MatGDUploadDBDeadline smallint = NULL,
	@MatGDCreditCardValidation smallint = NULL,
	@MatGDPlanSignUpDeadline smallint = NULL
)
AS
INSERT INTO MaterialGroupsDtl (MatGHId, MatGPrdId, MatGDMailDate, MatGDSignUpDate, MatGDImage, MatGDDisplayType, MatGDMalPId, MatGDSignUpDeadline, MatGDUploadDBDeadline, MatGDCreditCardValidation, MatGDPlanSignUpDeadline)
 VALUES (@MatGHId, @MatGPrdId, @MatGDMailDate, @MatGDSignUpDate, @MatGDImage, @MatGDDisplayType, @MatGDMalPId, @MatGDSignUpDeadline, @MatGDUploadDBDeadline, @MatGDCreditCardValidation, @MatGDPlanSignUpDeadline);


GO
