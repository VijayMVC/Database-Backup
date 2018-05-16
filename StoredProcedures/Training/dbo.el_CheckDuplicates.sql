/****** Object:  StoredProcedure [dbo].[el_CheckDuplicates]    Script Date: 5/15/2018 12:13:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE el_CheckDuplicates
(  
	@UserName varchar(50),
	@StoreNumber int
)

AS

SELECT UserName 
FROM AWUsers 
WHERE 
	UserName = @UserName
	AND WebID = @StoreNumber
GO
