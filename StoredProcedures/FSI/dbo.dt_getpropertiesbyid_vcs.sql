/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs]    Script Date: 5/15/2018 12:09:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure dbo.dt_getpropertiesbyid_vcs
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
