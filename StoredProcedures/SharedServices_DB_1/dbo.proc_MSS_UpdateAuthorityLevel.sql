/****** Object:  StoredProcedure [dbo].[proc_MSS_UpdateAuthorityLevel]    Script Date: 5/15/2018 12:11:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_UpdateAuthorityLevel( 
    @Url NVARCHAR(2048), 
    @AuthorityLevel INT  )
AS
  update
      dbo.MSSClickDistanceSeeds
   set
      AuthorityLevel = @AuthorityLevel
   where
      DisplayUrl = @Url

GO
