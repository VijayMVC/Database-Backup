/****** Object:  StoredProcedure [dbo].[GetAllProofGroupsByWebNumber]    Script Date: 5/15/2018 12:13:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE Procedure GetAllProofGroupsByWebNumber
(
	@WebNumber int,
	@OrderByColumn varchar(15),
	@PageNumber int,
	@RecordsPerPage int
)
As

set nocount on;

--handle the paging
--Declare @OrderByDirection varchar(4)
--Set @OrderByDirection = 'ASC'
Declare @OrderBy varchar(50)
Declare @SQL varchar(8000)
if (@OrderByColumn = 'LastUpdated')
	Set @OrderBy = 'isnull(max(p.LastUpdated),pg.DateCreated) DESC'
else if (@OrderByColumn = 'InvoiceNumber')
	Set @OrderBy = 'InvoiceNumber'
else if (@OrderByColumn = 'Customer')
	Set @OrderBy = 'min(cc.Name)'

Set @SQL = '
	Declare @WebNumber int
	Declare @PageNumber int
	Declare @RecordsPerPage int
	Set @WebNumber=' + Convert(varchar(10), @WebNumber) + '
	Set @PageNumber=' + Convert(varchar(10), @PageNumber) + '
	Set @RecordsPerPage=' + Convert(varchar(10), @RecordsPerPage) + '
	select
	pg.*
	From
	(	--Pull Back all the records we care about
		Select 
			ROW_NUMBER() OVER(Order By ' + @OrderBy + ') as RowNumber, 
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
			where c.WebNumber=@WebNumber
			Group By pg.DateCreated, pg.InvoiceNumber, pg.CustomerNotification, 
				pg.CreatedBy, pg.ProofGroup_Id, pg.FastsignsCenter_Id
	) ordered
	Inner join ProofGroup pg
		on ordered.ProofGroup_Id=pg.ProofGroup_Id
Where 
	RowNumber >= ((@PageNumber-1)*@RecordsPerPage)+1 and RowNumber < ((@PageNumber-1)*@RecordsPerPage) + @RecordsPerPage + 1'
exec @SQL

Set nocount off;
GO
