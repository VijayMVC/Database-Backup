/****** Object:  StoredProcedure [dbo].[ev_GetAgenda_OM05]    Script Date: 5/15/2018 12:13:19 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE ev_GetAgenda_OM05
(
	@EventID int,
	@AgendaTypeID int
)
AS

SELECT *
FROM FII_Functions.dbo.ev_Agenda
WHERE
	EventID = @EventID
	AND AgendaTypeID = @AgendaTypeID
GO
