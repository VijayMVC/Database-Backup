/****** Object:  StoredProcedure [dbo].[sp_DTA_start_xmlprefix]    Script Date: 5/15/2018 12:10:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_DTA_start_xmlprefix
as
begin
	declare @startTags nvarchar(128)
	set @startTags = N'<DTAXML><DTAOutput><AnalysisReport>'
	select @startTags
end

GO
