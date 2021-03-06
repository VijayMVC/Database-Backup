/****** Object:  View [dbo].[vw_Contacts]    Script Date: 5/15/2018 12:14:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON







CREATE VIEW [dbo].[vw_Contacts]
AS
SELECT  users.users_id
      , users.franchise_id AS ZW_Franchise_ID
      , users.users_id AS ContactID
      , users.accounts_id AS CustomerID
      , users.first_name  AS FirstName
      , users.last_name AS LastName
      , users.job_title  AS Title
      , WorkPhone.PhoneNumber AS PhoneNumber
      , WorkPhone.PhoneExtention  AS PhoneExtention
      , CASE WHEN WorkPhone.PrimaryPhone = 1 THEN 'Y'
             ELSE 'N'
        END AS PrimaryPhone
      , FAXPhone.FAXNumber  AS FaxNumber
      , CAST(Email.value AS VARCHAR(75)) AS Email
      , contact_data.primary_flag
      , contact_data.billing_flag
      , users.active AS IsActive
	  , users.user_types_id
FROM    users
        LEFT JOIN contact_data ON users.users_id = contact_data.users_id
        LEFT JOIN ( SELECT  users_phone.users_id
                          , users_phone.telephone AS PhoneNumber
                          , users_phone.ext AS PhoneExtention
                          , users_phone.primary_phone AS PrimaryPhone
                    FROM    users_phone
                            INNER JOIN phone_types ON users_phone.phone_type_id = phone_types.phone_type_id
                    WHERE   phone_types.name = 'Work'
                  ) AS WorkPhone ON users.users_id = WorkPhone.users_id
        LEFT JOIN ( SELECT  users_phone.users_id
                          , users_phone.telephone AS FAXNumber
                    FROM    users_phone
                            INNER JOIN phone_types ON users_phone.phone_type_id = phone_types.phone_type_id
                    WHERE   phone_types.name = 'FAX'
                  ) AS FAXPhone ON users.users_id = FAXPhone.users_id
        LEFT JOIN entity_attribute_values Email ON Email.entity_id = users.users_id AND Email.attribute_slug = 'Email'
-- TAF 10/1/14 To fix missing used with no users.user_types_id 
WHERE   users.user_types_id = '1'










GO
