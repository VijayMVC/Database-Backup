/****** Object:  StoredProcedure [dbo].[sub_CoOpStoreInsert]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_CoOpStoreInsert
(
	@CoOpID int,
	@WebNumber varchar(4)
)
AS
DELETE FROM CoOpStores
WHERE
	CoOpID = @CoOpID AND
	WebNumber = @WebNumber
INSERT INTO CoOpStores(CoOpID, WebNumber)
VALUES(@CoOpID, @WebNumber)



GO
