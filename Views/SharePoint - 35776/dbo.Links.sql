/****** Object:  View [dbo].[Links]    Script Date: 5/15/2018 12:14:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Links]
AS
    SELECT
        *
    FROM
        AllLinks
    WHERE
        DeleteTransactionId = 0x

GO
