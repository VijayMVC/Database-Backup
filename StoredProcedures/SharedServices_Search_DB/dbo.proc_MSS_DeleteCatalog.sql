/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteCatalog]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteCatalog
       @strCatalogName nvarchar(256)
AS
begin

    exec proc_MSS_ResetCatalog 1

end

GO
