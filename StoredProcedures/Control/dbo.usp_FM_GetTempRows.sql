/****** Object:  StoredProcedure [dbo].[usp_FM_GetTempRows]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:                            <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_GetTempRows]
                -- Add the parameters for the stored procedure here

AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

    -- Insert statements for procedure here
select top 1000 * from tempdb.dbo.FM_ToSync

END

GRANT EXECUTE ON [dbo].[usp_FM_GetTempRows] TO [FastSigns\app_Xpress_prod]
GRANT EXECUTE ON [dbo].[usp_FM_GetTempRows] TO [FASTSIGNS\IS-AppDev]

GO
