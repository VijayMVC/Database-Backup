/****** Object:  StoredProcedure [dbo].[sp_insertDboMetro]    Script Date: 5/15/2018 12:10:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertDboMetro]
	@Name nvarchar(50),
	@MetroID nvarchar(50),
	@LSTID nvarchar(50),
	@IYPID nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int
	select @intReturnCode = 0
	
		if EXISTS (select * from dbo.Metro where Name = @Name)
		BEGIN
		  UPDATE dbo.Metro
			SET MetroID = cast (isnull(@MetroID,'0') as int), LSTID = cast (isnull(@LSTID,'0') as int), 
				IYPID = cast (isnull(@IYPID,'0') as int)
			where Name = @Name
		END
		ELSE
		BEGIN
			Insert dbo.Metro (Name, MetroID, LSTID, IYPID )
			Values (@Name,cast (isnull(@MetroID,'0') as int), cast (isnull(@LSTID,'0') as int), cast (isnull(@IYPID,'0') as int) )
		END

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
