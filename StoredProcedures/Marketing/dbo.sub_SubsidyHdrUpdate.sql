/****** Object:  StoredProcedure [dbo].[sub_SubsidyHdrUpdate]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE sub_SubsidyHdrUpdate
(
	@CoOpOnly varchar(10),
	@SubHID int
)
AS

UPDATE SubsidyHdr 
SET
	CoOpOnly = @CoOpOnly
WHERE
	SubHID = @SubHID
GO
