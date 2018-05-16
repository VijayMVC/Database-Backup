/****** Object:  StoredProcedure [dbo].[sub_SubsidyDtlInsert]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE sub_SubsidyDtlInsert
(
	@SubDCalanderYear int,
	@SubHID int,
	@SubDUpToAmount float,
	@SubDAmount float,
	@SubDDesc varchar(50)
)
AS
DECLARE @NewID int
SELECT @NewID = SubDID FROM subsidyDtl order by SubDID
SELECT @NewID = @NewID + 1
INSERT INTO SubsidyDtl(SubDID, SubHID, SubDCalanderYear, SubDDesc, SubDUpToAmount, SubDAmount, SubDDisable)
VALUES(@NewID, @SubHID, @SubDCalanderYear, @SubDDesc, @SubDUpToAmount, @SubDAmount, 'N')



GO
