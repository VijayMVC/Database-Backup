/****** Object:  StoredProcedure [dbo].[fs_InsertComment]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE fs_InsertComment 
(   @UserID int,
    @Comment varchar(1000)   )
AS
UPDATE AWUserModules
SET Comments = @Comment
WHERE UserID = @UserID
GO
