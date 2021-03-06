/****** Object:  StoredProcedure [dbo].[sp_insertFact800Calls]    Script Date: 5/15/2018 12:10:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertFact800Calls]
	@Phone nvarchar(30),
	@Month nvarchar(30),
	@ConnectedCalls int,
	@ConnectedMinutes int,
	@MissedCalls int,
	@BusyCalls int
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int, @PK_Store int
	select @intReturnCode = 0
	
	select @PK_Store = (select TOP 1 a.PK_Store from Analysis.DimStore a, dbo.WebnumberPhone b
						where b.Phone = @Phone and a.Webnumber = b.Webnumber and a.DimStore_SCD_End_Date is null)

	if @PK_Store is not null
	BEGIN
		if EXISTS (select * from Analysis.Fact800Calls where FK_Store = @PK_Store and FK_Date = CONVERT(datetime, @Month, 101))
		BEGIN
		  UPDATE Analysis.Fact800Calls
			SET ConnectedCalls=@ConnectedCalls, ConnectedMinutes =@ConnectedMinutes, MissedCalls=@MissedCalls,BusyCalls=@BusyCalls
			where FK_Store = @PK_Store and FK_Date = CONVERT(datetime, @Month, 101)
		END
		ELSE
		BEGIN
			Insert Analysis.Fact800Calls (FK_Store, FK_Date, ConnectedCalls,ConnectedMinutes,MissedCalls, BusyCalls  )
			Values (@PK_Store, CONVERT(datetime, @Month, 101), @ConnectedCalls,@ConnectedMinutes,@MissedCalls, @BusyCalls)
		END
	END

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
