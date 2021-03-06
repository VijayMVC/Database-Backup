/****** Object:  StoredProcedure [dbo].[SubsidyDtlAdd]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SubsidyDtlAdd
(
	@SubDId int = NULL,
	@SubHId int = NULL,
	@SubDCalanderYear smallint = NULL,
	@SubDDesc varchar(50) = NULL,
	@SubDUptoAmount real = NULL,
	@SubDAmount real = NULL,
	@SubDRule1 smallint = NULL,
	@SubDStoreField varchar(50) = NULL,
	@SubDStoreValue varchar(2000) = NULL,
	@SubDDisable char(1) = NULL
)
AS
INSERT INTO SubsidyDtl (SubDId, SubHId, SubDCalanderYear, SubDDesc, SubDUptoAmount, SubDAmount, SubDRule1, SubDStoreField, SubDStoreValue, SubDDisable)
 VALUES (@SubDId, @SubHId, @SubDCalanderYear, @SubDDesc, @SubDUptoAmount, @SubDAmount, @SubDRule1, @SubDStoreField, @SubDStoreValue, @SubDDisable);


GO
