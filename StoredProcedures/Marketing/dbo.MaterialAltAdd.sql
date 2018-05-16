/****** Object:  StoredProcedure [dbo].[MaterialAltAdd]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialAltAdd
(
	@MatId int = NULL,
	@MatAltId int = NULL,
	@MatAltOrder smallint = NULL
)
AS
INSERT INTO MaterialAlt (MatId, MatAltId, MatAltOrder)
 VALUES (@MatId, @MatAltId, @MatAltOrder);


GO
