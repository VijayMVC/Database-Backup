/****** Object:  UserDefinedFunction [dbo].[GetOrderXML]    Script Date: 5/15/2018 12:14:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION GetOrderXML 
(
@xmlData XML
) 
RETURNS varchar(1023)
as
BEGIN 
DECLARE @retval varchar(1023)
SELECT @retval=
  ref.value('CheckoutAttributeValue[1]', 'Varchar(1023)') -- AS IDValue 
FROM
  @xmlData.nodes('/Attributes/CheckoutAttribute') xmlData (ref) 
RETURN @retval
END 

GO
