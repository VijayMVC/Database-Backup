/****** Object:  StoredProcedure [dbo].[CreateSegmentedChunk]    Script Date: 5/15/2018 12:09:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

create proc [dbo].[CreateSegmentedChunk]
	@SnapshotId		uniqueidentifier,
	@IsPermanent	bit, 
	@ChunkName		nvarchar(260),
	@ChunkFlags		tinyint, 
	@ChunkType		int, 
	@Version		smallint, 
	@MimeType		nvarchar(260) = null, 
	@Machine		nvarchar(512),
	@ChunkId		uniqueidentifier out
as begin
	declare @output table (ChunkId uniqueidentifier) ;
	if (@IsPermanent = 1) begin
		delete SegmentedChunk
		where SnapshotDataId = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType
		
		delete ChunkData
		where SnapshotDataID = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType
							
		insert SegmentedChunk(SnapshotDataId, ChunkFlags, ChunkName, ChunkType, Version, MimeType)
		output inserted.ChunkId into @output
		values (@SnapshotId, @ChunkFlags, @ChunkName, @ChunkType, @Version, @MimeType) ;
	end
	else begin
		delete [KeystoneReportServerTempDB].dbo.SegmentedChunk
		where SnapshotDataId = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType
		
		delete [KeystoneReportServerTempDB].dbo.ChunkData
		where SnapshotDataID = @SnapshotId and ChunkName = @ChunkName and ChunkType = @ChunkType

		insert [KeystoneReportServerTempDB].dbo.SegmentedChunk(SnapshotDataId, ChunkFlags, ChunkName, ChunkType, Version, MimeType, Machine)
		output inserted.ChunkId into @output
		values (@SnapshotId, @ChunkFlags, @ChunkName, @ChunkType, @Version, @MimeType, @Machine) ;
	end
	select top 1 @ChunkId = ChunkId from @output
end

GO
