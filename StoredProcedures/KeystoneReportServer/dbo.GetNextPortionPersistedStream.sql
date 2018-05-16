/****** Object:  StoredProcedure [dbo].[GetNextPortionPersistedStream]    Script Date: 5/15/2018 12:09:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@Length int
AS

READTEXT [KeystoneReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @Length

GO
