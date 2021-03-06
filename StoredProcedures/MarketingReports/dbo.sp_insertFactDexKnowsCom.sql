/****** Object:  StoredProcedure [dbo].[sp_insertFactDexKnowsCom]    Script Date: 5/15/2018 12:10:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_insertFactDexKnowsCom]
	@WebNumber int,
	@Month nvarchar(30),
	@Clicks int,
	@CPC money,
	@CostByMonth money,
	@Calls int
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int, @PK_Store int
	select @intReturnCode = 0
	
	select @PK_Store = (select TOP 1 PK_Store from Analysis.DimStore where Webnumber = @WebNumber and DimStore_SCD_End_Date is null)

    if @PK_Store is null
	Begin
		select @PK_Store = (select TOP 1 PK_Store from Analysis.DimStore where Webnumber = @WebNumber and DimStore_SCD_End_Date is not null and DimStore_SCD_End_Date >= CONVERT(datetime, @Month, 101))
	End


	if @PK_Store is not null
	BEGIN
		if EXISTS (select * from Analysis.FactDexKnowsCom where FK_Store = @PK_Store and FK_Date = CONVERT(datetime, @Month, 101))
		BEGIN
		  UPDATE Analysis.FactDexKnowsCom
			SET Clicks=@Clicks, CPC =@CPC, CostByMonth=@CostByMonth,Calls=@Calls
			where FK_Store = @PK_Store and FK_Date = CONVERT(datetime, @Month, 101)
		END
		ELSE
		BEGIN
			Insert Analysis.FactDexKnowsCom (FK_Store, FK_Date, Clicks,CPC,CostByMonth,Calls  )
			Values (@PK_Store, CONVERT(datetime, @Month, 101), @Clicks,@CPC,@CostByMonth,@Calls)
		END
	END

	select @intReturnCode = @@error
	return @intReturnCode
END
GO
