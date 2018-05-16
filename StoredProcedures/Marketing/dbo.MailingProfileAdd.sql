/****** Object:  StoredProcedure [dbo].[MailingProfileAdd]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MailingProfileAdd
(
	@MalPId int = NULL,
	@MalPName varchar(50) = NULL,
	@MalPTelemIncluded char(1) = NULL,
	@SicHId int = NULL
)
AS
INSERT INTO MailingProfile (MalPId, MalPName, MalPTelemIncluded, SicHId)
 VALUES (@MalPId, @MalPName, @MalPTelemIncluded, @SicHId);


GO
