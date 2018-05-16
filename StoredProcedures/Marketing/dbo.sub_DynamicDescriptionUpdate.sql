/****** Object:  StoredProcedure [dbo].[sub_DynamicDescriptionUpdate]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_DynamicDescriptionUpdate
(
	@DynID int,
   	@Filename varchar (100),
	@Category varchar(100),
	@Description varchar(1000)
)
 AS
UPDATE DynamicDescription
SET
 	DynDescFilename = @Filename,
	DynDescCategory = @Category,
	DynDescDescription = @Description
WHERE 
	DynDescId = @DynID



GO
