/****** Object:  StoredProcedure [dbo].[sp_DTA_end_xmlprefix]    Script Date: 5/15/2018 12:10:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_DTA_end_xmlprefix
as
begin
	declare @endTags nvarchar(128)
	set @endTags = N'</AnalysisReport></DTAOutput></DTAXML>'
	select @endTags
end

GO
