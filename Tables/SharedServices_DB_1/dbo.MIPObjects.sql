/****** Object:  Table [dbo].[MIPObjects]    Script Date: 5/15/2018 12:05:10 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MIPObjects](
	[ObjectId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[Version] [bigint] NOT NULL,
	[Xml] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LongXml] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [PK_MIPObjects] PRIMARY KEY NONCLUSTERED 
(
	[ObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Trigger [dbo].[trig_MIP_ObjectDelete]    Script Date: 5/15/2018 12:05:10 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
create trigger trig_MIP_ObjectDelete
on
	dbo.MIPObjects for delete
as
	set nocount on

	declare @Version bigint
	declare @error int
	exec @error = dbo.proc_MIP_GetNextVersion 1, @Version output
	if (@error != 0)
		return 

	insert into dbo.MIPTombstones
	(
		ObjectId,
		Version,
		LastModified
	)
	select
		ObjectId,
		@Version,
		getutcdate()
	from deleted

	delete from
		dbo.MIPTombstones
	where
		(datediff(day, LastModified, getutcdate()) > 7)

GO
