/****** Object:  StoredProcedure [dbo].[sp_update_storesubscription]    Script Date: 5/15/2018 12:09:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_update_storesubscription
@store_number bigint,
@store_subsc_id bigint
as
update fiisecurity.dbo.sec_storesubscription
set state_id = 3
where store_number = @store_number
and store_subsc_id = @store_subsc_id
GO
