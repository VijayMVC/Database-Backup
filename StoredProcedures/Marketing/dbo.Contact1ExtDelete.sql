/****** Object:  StoredProcedure [dbo].[Contact1ExtDelete]    Script Date: 5/15/2018 12:10:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.Contact1ExtDelete
(
	@Contact1ExtID int
)
AS
	DELETE FROM Contact1Ext WHERE Contact1ExtID=@Contact1ExtID;
RETURN @@Rowcount;


GO
