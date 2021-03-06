/****** Object:  StoredProcedure [dbo].[GetProofGroupsByWebNumber]    Script Date: 5/15/2018 12:13:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE Procedure [dbo].[GetProofGroupsByWebNumber]
(
	@WebNumber int,
	@OrderByColumn varchar(15),
	@PageNumber int,
	@RecordsPerPage int
)
As


--handle the paging
if (@OrderByColumn = 'LastUpdated')
	select
		pg.[DateCreated]
      ,pg.[InvoiceNumber]
      ,pg.[CustomerNotification]
      ,pg.[CreatedBy]
      ,pg.[ProofGroup_Id]
      ,pg.[FastsignsCenter_Id]
      ,pg.[PGUID]
      ,pg.[JobDescription]
	From
	(	--Pull Back all the records we care about
		Select 
			ROW_NUMBER() OVER(Order By isnull(max(p.LastUpdated),pg.DateCreated) DESC) as RowNumber, 
			pg.ProofGroup_Id
			from ProofGroup pg 
			inner join FastsignsCenter c 
				on pg.FastsignsCenter_Id=c.FastsignsCenter_Id
			left outer join CenterCustomer_ProofGroup ccpg
				on pg.ProofGroup_Id=ccpg.ProofGroup_Id
			left outer join CenterCustomer cc
				on cc.CenterCustomer_Id=ccpg.CenterCustomer_Id
			left outer join Proof p 
				on pg.ProofGroup_Id=p.ProofGroup_Id
			where DateAdd(d,isnull(c.DaysToKeepProofGroups,90),pg.DateCreated) > getdate()
					and c.WebNumber=@WebNumber
			Group By pg.DateCreated, pg.InvoiceNumber, pg.CustomerNotification, 
				pg.CreatedBy, pg.ProofGroup_Id, pg.FastsignsCenter_Id
	) ordered
	Inner join ProofGroup pg
		on ordered.ProofGroup_Id=pg.ProofGroup_Id
	Where 
		RowNumber >= ((@PageNumber-1)*@RecordsPerPage)+1 and RowNumber < ((@PageNumber-1)*@RecordsPerPage) + @RecordsPerPage + 1
else if (@OrderByColumn = 'InvoiceNumber')
	select
		pg.[DateCreated]
      ,pg.[InvoiceNumber]
      ,pg.[CustomerNotification]
      ,pg.[CreatedBy]
      ,pg.[ProofGroup_Id]
      ,pg.[FastsignsCenter_Id]
      ,pg.[PGUID]
      ,pg.[JobDescription]
	From
	(	--Pull Back all the records we care about
		Select 
			ROW_NUMBER() OVER(Order By InvoiceNumber ASC) as RowNumber, 
			pg.ProofGroup_Id
			from ProofGroup pg 
			inner join FastsignsCenter c 
				on pg.FastsignsCenter_Id=c.FastsignsCenter_Id
			left outer join CenterCustomer_ProofGroup ccpg
				on pg.ProofGroup_Id=ccpg.ProofGroup_Id
			left outer join CenterCustomer cc
				on cc.CenterCustomer_Id=ccpg.CenterCustomer_Id
			left outer join Proof p 
				on pg.ProofGroup_Id=p.ProofGroup_Id
			where DateAdd(d,isnull(c.DaysToKeepProofGroups,90),pg.DateCreated) > getdate()
					and c.WebNumber=@WebNumber
			Group By pg.DateCreated, pg.InvoiceNumber, pg.CustomerNotification, 
				pg.CreatedBy, pg.ProofGroup_Id, pg.FastsignsCenter_Id
	) ordered
	Inner join ProofGroup pg
		on ordered.ProofGroup_Id=pg.ProofGroup_Id
	Where 
		RowNumber >= ((@PageNumber-1)*@RecordsPerPage)+1 and RowNumber < ((@PageNumber-1)*@RecordsPerPage) + @RecordsPerPage + 1
else if (@OrderByColumn = 'Customer')
	select
		pg.[DateCreated]
      ,pg.[InvoiceNumber]
      ,pg.[CustomerNotification]
      ,pg.[CreatedBy]
      ,pg.[ProofGroup_Id]
      ,pg.[FastsignsCenter_Id]
      ,pg.[PGUID]
      ,pg.[JobDescription]
	From
	(	--Pull Back all the records we care about
		Select 
			ROW_NUMBER() OVER(Order By min(cc.Name) ASC) as RowNumber, 
			pg.ProofGroup_Id
			from ProofGroup pg 
			inner join FastsignsCenter c 
				on pg.FastsignsCenter_Id=c.FastsignsCenter_Id
			left outer join CenterCustomer_ProofGroup ccpg
				on pg.ProofGroup_Id=ccpg.ProofGroup_Id
			left outer join CenterCustomer cc
				on cc.CenterCustomer_Id=ccpg.CenterCustomer_Id
			left outer join Proof p 
				on pg.ProofGroup_Id=p.ProofGroup_Id
			where DateAdd(d,isnull(c.DaysToKeepProofGroups,90),pg.DateCreated) > getdate()
					and c.WebNumber=@WebNumber
			Group By pg.DateCreated, pg.InvoiceNumber, pg.CustomerNotification, 
				pg.CreatedBy, pg.ProofGroup_Id, pg.FastsignsCenter_Id
	) ordered
	Inner join ProofGroup pg
		on ordered.ProofGroup_Id=pg.ProofGroup_Id
	Where 
		RowNumber >= ((@PageNumber-1)*@RecordsPerPage)+1 and RowNumber < ((@PageNumber-1)*@RecordsPerPage) + @RecordsPerPage + 1


GO
