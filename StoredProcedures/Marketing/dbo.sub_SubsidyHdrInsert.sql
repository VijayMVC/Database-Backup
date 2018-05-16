/****** Object:  StoredProcedure [dbo].[sub_SubsidyHdrInsert]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE sub_SubsidyHdrInsert
(
	@SubHType int,
	@SubHDesc varchar(50),
	@SubHMrktCountry int,
	@CoOpOnly int
)
AS
DECLARE @NewID int
SELECT @NewID = SubHID FROM subsidyHdr order by SubHID
SELECT @NewID = @NewID + 1
INSERT INTO SubsidyHdr(SubHID, SubHType, SubHDesc, SubHMrktCountry, SubHDisable, CoOpOnly)
VALUES(@NewID, @SubHType, @SubHDesc, @SubHMrktCountry, 'N', @CoOpOnly)



GO
