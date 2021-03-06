/****** Object:  StoredProcedure [dbo].[sp_insertFactFastMail]    Script Date: 5/15/2018 12:10:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_insertFactFastMail]
	@WebNumber int,
	@Type int,
	@Date nvarchar(30),
	@Emails int,
	@DeliveryRate decimal(18,4),
	@OpenRate decimal(18,4),
	@OptOutRate decimal(18,4),
	@UniqueClicks int,
	@UniqueOpens int,
	@ClickThroughRate decimal(18,4)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int, @PK_Store int
	select @intReturnCode = 0
	
	select @PK_Store = (select TOP 1 PK_Store from Analysis.DimStore where Webnumber = @WebNumber and DimStore_SCD_End_Date is null)

    if @PK_Store is null
	Begin
		select @PK_Store = (select TOP 1 PK_Store from Analysis.DimStore where Webnumber = @WebNumber and DimStore_SCD_End_Date is not null and DimStore_SCD_End_Date >= CONVERT(datetime, @Date, 101))
	End


	if @PK_Store is not null
	BEGIN
			Insert Analysis.FactFastMail (FK_Store, FK_FastMailType, FK_Date, Emails, DeliveryRate,OpenRate,OptOutRate,
					UniqueClicks,UniqueOpens, ClickThroughRate)
			Values (@PK_Store,@Type, CONVERT(datetime, @Date, 101), @Emails,@DeliveryRate,@OpenRate,@OptOutRate,@UniqueClicks,
					@UniqueOpens, @ClickThroughRate)
	END

	select @intReturnCode = @@error
	return @intReturnCode
END
GO
