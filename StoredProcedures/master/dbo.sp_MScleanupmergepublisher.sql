/****** Object:  StoredProcedure [dbo].[sp_MScleanupmergepublisher]    Script Date: 5/15/2018 12:10:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
create procedure dbo.sp_MScleanupmergepublisher
as
    exec sys.sp_MScleanupmergepublisher_internal

GO
