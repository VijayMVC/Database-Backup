/****** Object:  StoredProcedure [dbo].[ReadChunkPortion]    Script Date: 5/15/2018 12:10:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[ReadChunkPortion]
@ChunkPointer binary(16),
@IsPermanentSnapshot bit,
@DataIndex int,
@Length int
AS

IF @IsPermanentSnapshot != 0 BEGIN
    READTEXT ChunkData.Content @ChunkPointer @DataIndex @Length
END ELSE BEGIN
    READTEXT [KeystoneReportServerTempDB].dbo.ChunkData.Content @ChunkPointer @DataIndex @Length
END

GO
