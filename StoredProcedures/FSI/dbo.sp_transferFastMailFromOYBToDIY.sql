/****** Object:  StoredProcedure [dbo].[sp_transferFastMailFromOYBToDIY]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_transferFastMailFromOYBToDIY]
@webnumber int,
@channelid int
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      update _ExactTarget_Integration_Stores
      set channelmemberid = null, AccountID = @channelid
      where webnumber =@webnumber
END

GO
