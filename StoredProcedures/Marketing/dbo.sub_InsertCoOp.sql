/****** Object:  StoredProcedure [dbo].[sub_InsertCoOp]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_InsertCoOp
(
	@CoOpName varchar(50),
	@CountryID int
)
AS
INSERT INTO CoOps(CoOpName, CountryID)
VALUES(@CoOpName, @CountryID)



GO
