/****** Object:  StoredProcedure [dbo].[sp_MSrepl_startup]    Script Date: 5/15/2018 12:10:35 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

create procedure dbo.sp_MSrepl_startup
as
    exec sys.sp_MSrepl_startup_internal

GO
