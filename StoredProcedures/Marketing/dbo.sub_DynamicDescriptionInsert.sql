/****** Object:  StoredProcedure [dbo].[sub_DynamicDescriptionInsert]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_DynamicDescriptionInsert
(
   	@Filename varchar (100),
	@Category varchar(100),
	@Description varchar(1000)
)
 AS
SET NOCOUNT ON
INSERT INTO DynamicDescription
(
	DynDescFilename,
	DynDescCategory,
	DynDescDescription
)
VALUES
(
	@FileName,
	@Category,
	@Description   
)



GO
