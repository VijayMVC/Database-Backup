/****** Object:  View [dbo].[DocVersions]    Script Date: 5/15/2018 12:14:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[DocVersions]
AS
    SELECT
        *
    FROM
        AllDocVersions
    WHERE
        DeleteTransactionId = 0x

GO
