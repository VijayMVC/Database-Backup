/****** Object:  StoredProcedure [dbo].[WriteNextPortionPersistedStream]    Script Date: 5/15/2018 12:10:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[WriteNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@DeleteLength int,
@Content image
AS

UPDATETEXT [KeystoneReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @DeleteLength @Content

GO
