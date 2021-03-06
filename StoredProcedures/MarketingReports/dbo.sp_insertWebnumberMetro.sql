/****** Object:  StoredProcedure [dbo].[sp_insertWebnumberMetro]    Script Date: 5/15/2018 12:10:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertWebnumberMetro]
	@Webnumber int,
	@MetroID nvarchar(50),
	@LSTID nvarchar(50),
	@IYPID nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int
	select @intReturnCode = 0
	
		if EXISTS (select * from dbo.WebnumberMetro where Webnumber = @Webnumber)
		BEGIN
		  UPDATE dbo.WebnumberMetro
			SET MetroID = cast (isnull(@MetroID,'0') as int), LSTID = cast (isnull(@LSTID,'0') as int), 
				IYPID = cast (isnull(@IYPID,'0') as int)
			where Webnumber = @Webnumber
		END
		ELSE
		BEGIN
			Insert dbo.WebnumberMetro (Webnumber, MetroID, LSTID, IYPID )
			Values (@Webnumber,cast (isnull(@MetroID,'0') as int), cast (isnull(@LSTID,'0') as int), 
					cast (isnull(@IYPID,'0') as int) )
		END

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
