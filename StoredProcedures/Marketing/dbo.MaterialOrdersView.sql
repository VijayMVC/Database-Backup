/****** Object:  StoredProcedure [dbo].[MaterialOrdersView]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.MaterialOrdersView
(
	@StoreID int,
	@Year int
)
 AS
Select OH.OrdHId, OH.OrdHPrdType, OH.OrdHSignUpDeadline, OH.OrdHDate, OH.OrdHFulfillmentDate, OH.OrdHOrdered, M.MatName,
	Month(OH.OrdHOrdered) As OrderedDateMonth
	From OrderDtl O
	INNER JOIN OrderHdr OH ON
		O.OrdHId = OH.OrdHId
	Left OUTER JOIN Material M ON
		O.OrdDPrdId = M.MatID
Where OH.OrdHStoreId=@StoreID and Year(OH.OrdHOrdered)=@Year
and (OH.OrdHStatus <> 6)
and OH.OrdHPrdType=1
Order By OH.OrdHOrdered


GO
