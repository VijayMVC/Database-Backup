/****** Object:  StoredProcedure [dbo].[sp_checkchannel]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_checkchannel
@webnumber int
as
select zw_franchise_id, webnumber, storenumber, channelmemberid from _ExactTarget_Integration_Stores
where webnumber = @webnumber

GO
