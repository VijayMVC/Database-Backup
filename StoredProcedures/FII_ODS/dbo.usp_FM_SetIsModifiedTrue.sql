/****** Object:  StoredProcedure [dbo].[usp_FM_SetIsModifiedTrue]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE usp_FM_SetIsModifiedTrue 
      -- Add the parameters for the stored procedure here

AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      update Contact.FastMailDim 

      set IsModified =1

END

GO
