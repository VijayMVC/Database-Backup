/****** Object:  StoredProcedure [dbo].[SystinoOrderUpload_I]    Script Date: 5/15/2018 12:09:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


-- =============================================
-- Author:		<Holmes, Phillip>
-- Create date: <07/14/2011>
-- Description:	<Order tracking for systing uploads. Insure>
-- =============================================


/*************************************************************
DEPLOYMENT DATE:	08/16/2011
DEPLOYER:		Todd Peterson
CHANGESET:		2471
SERVER/DB:		01DALSPRODSQL1..DataWarehouse
COMMENTS:		
*************************************************************/

CREATE PROCEDURE SystinoOrderUpload_I
	-- Add the parameters for the stored procedure here
	@OrderID INT = NULL,
	@Submitted BIT = 0,
	@DateSubmitted DATETIME = getdate,
	@StoreID INT =  NULL,
	@FranchiseID varchar(40) =  NULL 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO System.[SystinoSubmittedOrders]
           ([OrderID]
           ,[Submitted]
           ,[DateSubmitted]
           ,[StoreID]
           ,[FranchiseID])
     VALUES
           (@OrderID
           ,@Submitted
           ,@DateSubmitted
           ,@StoreID
           ,@FranchiseID)
END

--GRANT EXECUTE ON SystinoOrderUpload_I to [FASTSIGNS\app_systino_prod]

--GO




GO
