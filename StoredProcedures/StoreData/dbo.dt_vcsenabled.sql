/****** Object:  StoredProcedure [dbo].[dt_vcsenabled]    Script Date: 5/15/2018 12:13:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create proc dbo.dt_vcsenabled

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */



GO
