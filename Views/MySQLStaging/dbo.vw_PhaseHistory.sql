/****** Object:  View [dbo].[vw_PhaseHistory]    Script Date: 5/15/2018 12:14:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vw_PhaseHistory]
--WITH SCHEMABINDING
AS
     SELECT
        job_line_items.job_line_item_id ,
        jobs.franchise_id ,
        jobs.sequence AS job ,
        job_line_items.sequence AS sequence ,
        job_line_items.name AS job_line_item_name ,
        phases.name AS phase_name ,
        phases.keyword ,
        phases.[order] AS phase_order,
        job_line_item_phase_history.set_on,
		job_line_item_phase_history.job_line_item_phase_history_id
    FROM
        dbo.job_line_item_phase_history
        INNER JOIN dbo.job_line_items ON job_line_items.job_line_item_id = job_line_item_phase_history.job_line_item_id
        INNER JOIN dbo.phases ON job_line_item_phase_history.phase_id = phases.phase_id
        INNER JOIN dbo.jobs ON jobs.job_id = job_line_items.job_id




GO
