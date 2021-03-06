/****** Object:  StoredProcedure [dbo].[MaterialGroupsHdrAdd]    Script Date: 5/15/2018 12:10:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsHdrAdd
(
	@MatGHId int = NULL,
	@MatGHType tinyint = NULL,
	@MatGHName varchar(125) = NULL,
	@MatGHDesc varchar(250) = NULL,
	@MatGHSignUpDate smalldatetime = NULL,
	@MatGHImage varchar(50) = NULL,
	@MatGHDisplayType tinyint = NULL,
	@MatGHMalPId int = NULL,
	@MatGHSignUpDeadline smallint = NULL,
	@MatGHUploadDBDeadline smallint = NULL,
	@MatGHCreditCardValidation smallint = NULL,
	@MatGHPlanSignUpDeadline smallint = NULL,
	@MatGHMailingType tinyint = NULL
)
AS
INSERT INTO MaterialGroupsHdr (MatGHId, MatGHType, MatGHName, MatGHDesc, MatGHSignUpDate, MatGHImage, MatGHDisplayType, MatGHMalPId, MatGHSignUpDeadline, MatGHUploadDBDeadline, MatGHCreditCardValidation, MatGHPlanSignUpDeadline, MatGHMailingType)
 VALUES (@MatGHId, @MatGHType, @MatGHName, @MatGHDesc, @MatGHSignUpDate, @MatGHImage, @MatGHDisplayType, @MatGHMalPId, @MatGHSignUpDeadline, @MatGHUploadDBDeadline, @MatGHCreditCardValidation, @MatGHPlanSignUpDeadline, @MatGHMailingType);


GO
