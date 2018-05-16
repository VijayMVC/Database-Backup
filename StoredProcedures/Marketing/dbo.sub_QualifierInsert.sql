/****** Object:  StoredProcedure [dbo].[sub_QualifierInsert]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE sub_QualifierInsert
(
	@SubDID int,
	@QualifierName varchar(50)
)
AS
INSERT INTO SubsidyQualifiers(SubDID, QualifierName, Active, DateCreated)
VALUES(@SubDID, @QualifierName, 1, getDate())



GO
