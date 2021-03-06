/****** Object:  StoredProcedure [dbo].[sp_insertWebnumberPhone]    Script Date: 5/15/2018 12:10:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertWebnumberPhone]
	@Webnumber int,
	@Phone nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int
	select @intReturnCode = 0
	
		if EXISTS (select * from dbo.WebnumberPhone where Webnumber = @Webnumber)
		BEGIN
		  UPDATE dbo.WebnumberPhone
			SET Phone = @Phone
			where Webnumber = @Webnumber
		END
		ELSE
		BEGIN
			Insert dbo.WebnumberPhone (Webnumber, Phone )
			Values (@Webnumber,@Phone )
		END

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
