/****** Object:  StoredProcedure [dbo].[sp_setchannelnull]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

create procedure[dbo].[sp_setchannelnull]
@webnumber int
as
update _ExactTarget_Integration_Stores
set channelmemberid = null
where webnumber =@webnumber


GO
