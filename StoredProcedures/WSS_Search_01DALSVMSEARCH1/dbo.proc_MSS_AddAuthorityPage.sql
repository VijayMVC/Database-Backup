/****** Object:  StoredProcedure [dbo].[proc_MSS_AddAuthorityPage]    Script Date: 5/15/2018 12:13:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddAuthorityPage(
	@Url NVARCHAR(2048),
	@Hash INT,
	@AuthorityLevel INT )
AS
	INSERT INTO dbo.MSSClickDistanceSeeds VALUES (@Url, @Hash, @AuthorityLevel )

GO
