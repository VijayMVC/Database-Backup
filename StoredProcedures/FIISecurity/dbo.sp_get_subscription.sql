/****** Object:  StoredProcedure [dbo].[sp_get_subscription]    Script Date: 5/15/2018 12:09:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_get_subscription
@store_num bigint
as
select * from fiisecurity.dbo.sec_storesubscription
where store_number = @store_num





GO
