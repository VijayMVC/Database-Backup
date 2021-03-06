/****** Object:  View [dbo].[Division]    Script Date: 5/15/2018 12:14:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW Division AS select 
    ID	
    , StoreID	
    , ClassTypeID	
    , ModifiedByUser	
    , ModifiedByComputer	
    , ModifiedDate	
    , SeqID	
    , IsSystem	
    , IsActive	
    , DivisionName	
    , PrintAsName	
    , ParentID
    , TaxClassID
    , (select max(LogoID) from Store) as LogoID
    , EmailAddress	
    , MainPhoneNumberID	
    , MainFaxNumberID	
    , AddressID	
    , AddressLinkID
    , PrimaryNumber	
    , PriNumberTypeID	
    , PriNumberTypeText	
    , SecondaryNumber	
    , SecNumberTypeID	
    , SecNumberTypeText	
    , ThirdNumber	
    , ThirdNumberTypeID	
    , ThirdNumberTypeText	
from EmployeeGroup
where IsDivision = 1

GO
