/****** Object:  StoredProcedure [dbo].[proc_GetListFields]    Script Date: 5/15/2018 12:12:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_GetListFields( @WebId uniqueidentifier, @ListId uniqueidentifier)AS SET NOCOUNT ON SELECT tp_Fields FROM Lists WHERE Lists.tp_WebId = @WebId AND Lists.tp_Id = @ListId

GO
