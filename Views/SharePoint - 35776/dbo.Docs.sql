/****** Object:  View [dbo].[Docs]    Script Date: 5/15/2018 12:14:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Docs]
AS
    SELECT
        *
    FROM
        AllDocs
    WHERE
        DeleteTransactionId = 0x

GO
