/****** Object:  StoredProcedure [dbo].[sp_setchannel]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create proc sp_setchannel
@channelid int,
@webnumber int
as
update _ExactTarget_Integration_Stores
set channelmemberid = @channelid
where webnumber =@webnumber

GO
