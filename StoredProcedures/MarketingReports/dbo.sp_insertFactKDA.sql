/****** Object:  StoredProcedure [dbo].[sp_insertFactKDA]    Script Date: 5/15/2018 12:10:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_insertFactKDA]
	@WebNumber int,
	@Month nvarchar(30),
	@NationalMailings int,
	@ScheduledMailings int,
	@OnDemandMailings int
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
		if EXISTS (select * from Analysis.FactKDA where FK_Store = @PK_Store and FK_Date = CONVERT(datetime, @Month, 101))
		BEGIN
		  UPDATE Analysis.FactKDA
			SET NationalMailings=@NationalMailings, ScheduledMailings =@ScheduledMailings, OnDemandMailings=@OnDemandMailings
			where FK_Store = @PK_Store and FK_Date = CONVERT(datetime, @Month, 101)
		END
		ELSE
		BEGIN
			Insert Analysis.FactKDA (FK_Store, FK_Date, NationalMailings,ScheduledMailings,OnDemandMailings  )
			Values (@PK_Store, CONVERT(datetime, @Month, 101), @NationalMailings,@ScheduledMailings,@OnDemandMailings)
		END
	END

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
