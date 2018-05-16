/****** Object:  StoredProcedure [dbo].[sub_RemoveStoreFromCoOp]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_RemoveStoreFromCoOp
(
	@CoOpID int,
	@WebNumber varchar(4)
)
AS
DELETE FROM CoOpStores
WHERE
	CoOpID = @CoOpID AND
	WebNumber = @WebNumber



GO
