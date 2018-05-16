/****** Object:  StoredProcedure [dbo].[el_InsertLogModule]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE el_InsertLogModule
(   @UserID int,
    @ModuleID int,
    @WebID int )

AS

INSERT INTO awLogModules
(
	UserID, 
	ModuleID, 
	WebID, 
	DateAccessed
) 
VALUES
(
	@UserID, 
	@ModuleID, 
	@WebID, 
	getDate()
)
GO
