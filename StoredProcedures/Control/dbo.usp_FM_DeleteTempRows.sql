/****** Object:  StoredProcedure [dbo].[usp_FM_DeleteTempRows]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:                            <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_DeleteTempRows]
                -- Add the parameters for the stored procedure here
@ContactKeys nvarchar(max)

AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                Delete from tempdb.dbo.FM_ToSync 
                where ContactKey IN (Select Value From FII_ODS.dbo.FnSplit(@ContactKeys, ','))
    -- Insert statements for procedure here
                
END




GO
