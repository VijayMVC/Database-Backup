/****** Object:  StoredProcedure [dbo].[fs_GetStoreInfoByStoreNumberForNAP]    Script Date: 5/15/2018 12:09:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[fs_GetStoreInfoByStoreNumberForNAP]
	-- Add the parameters for the stored procedure here
	(@StoreNumber int)
AS 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT StoreNumber as Key1
	,WebNumber AS UWEBNUMBER
	,VanityName AS Contact
	,Address AS Address1
	,'' AS Address2
	,	CityName AS City
	,StateName AS State
	,Zip as ZIP
	,Phone as Phone1
	,FAX as Fax
	,StoreOpenDate
	,'1/1/2100' AS StoreResaleDate
	,FBC
	,Email
	,Country
	,'No' AS UEMC
	,OpenStatus AS Key5
	,'1/1/2100' AS UNAPAGRDAT
	,1 AS UNAPELECTR
 -- <s:element minOccurs="0" maxOccurs="1" name="ZIP" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="Phone" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="Fax" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="StoreOpenDate" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="StoreResaleDate" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="FBC" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="STB" type="s:string" /> 
 -- <s:element minOccurs="0" maxOccurs="1" name="Key5" type="s:string" /> 
 -- <s:element minOccurs="1" maxOccurs="1" name="HasNAPAgreement" type="s:boolean" /> 
 -- <s:element minOccurs="1" maxOccurs="1" name="IsNAPEletricalCapable" type="s:boolean" /> 
FROM vw_Store
where StoreNumber=@StoreNumber 


GO
