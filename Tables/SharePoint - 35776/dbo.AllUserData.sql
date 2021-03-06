/****** Object:  Table [dbo].[AllUserData]    Script Date: 5/15/2018 12:05:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AllUserData](
	[tp_ID] [int] NOT NULL,
	[tp_ListId] [uniqueidentifier] NOT NULL,
	[tp_SiteId] [uniqueidentifier] NOT NULL,
	[tp_RowOrdinal] [int] NOT NULL,
	[tp_Version] [int] NOT NULL,
	[tp_Author] [int] NULL,
	[tp_Editor] [int] NULL,
	[tp_Modified] [datetime] NULL,
	[tp_Created] [datetime] NULL,
	[tp_Ordering] [varchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[tp_ThreadIndex] [varbinary](512) NULL,
	[tp_HasAttachment] [bit] NOT NULL,
	[tp_ModerationStatus] [int] NOT NULL,
	[tp_IsCurrent] [bit] NOT NULL,
	[tp_ItemOrder] [float] NULL,
	[tp_InstanceID] [int] NULL,
	[tp_GUID] [uniqueidentifier] NOT NULL,
	[tp_CopySource] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[tp_HasCopyDestinations] [bit] NULL,
	[tp_AuditFlags] [int] NULL,
	[tp_InheritAuditFlags] [int] NULL,
	[tp_Size] [int] NOT NULL,
	[tp_WorkflowVersion] [int] NULL,
	[tp_WorkflowInstanceID] [uniqueidentifier] NULL,
	[tp_DirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[tp_LeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[tp_DeleteTransactionId] [varbinary](16) NOT NULL,
	[tp_ContentType] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[tp_ContentTypeId] [dbo].[tContentTypeId] NULL,
	[nvarchar1] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar2] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar3] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar4] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar5] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar6] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar7] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar8] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext1] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext2] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext3] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext4] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant1] [sql_variant] NULL,
	[nvarchar9] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar10] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar11] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar12] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar13] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar14] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar15] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar16] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext5] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext6] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext7] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext8] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant2] [sql_variant] NULL,
	[nvarchar17] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar18] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar19] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar20] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar21] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar22] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar23] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar24] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext9] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext10] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext11] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext12] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant3] [sql_variant] NULL,
	[nvarchar25] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar26] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar27] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar28] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar29] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar30] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar31] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar32] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext13] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext14] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext15] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext16] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant4] [sql_variant] NULL,
	[nvarchar33] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar34] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar35] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar36] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar37] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar38] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar39] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar40] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext17] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext18] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext19] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext20] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant5] [sql_variant] NULL,
	[nvarchar41] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar42] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar43] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar44] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar45] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar46] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar47] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar48] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext21] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext22] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext23] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext24] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant6] [sql_variant] NULL,
	[nvarchar49] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar50] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar51] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar52] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar53] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar54] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar55] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar56] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext25] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext26] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext27] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext28] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant7] [sql_variant] NULL,
	[nvarchar57] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar58] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar59] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar60] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar61] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar62] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar63] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[nvarchar64] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext29] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext30] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext31] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ntext32] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[sql_variant8] [sql_variant] NULL,
	[int1] [int] NULL,
	[int2] [int] NULL,
	[int3] [int] NULL,
	[int4] [int] NULL,
	[int5] [int] NULL,
	[int6] [int] NULL,
	[int7] [int] NULL,
	[int8] [int] NULL,
	[int9] [int] NULL,
	[int10] [int] NULL,
	[int11] [int] NULL,
	[int12] [int] NULL,
	[int13] [int] NULL,
	[int14] [int] NULL,
	[int15] [int] NULL,
	[int16] [int] NULL,
	[float1] [float] NULL,
	[float2] [float] NULL,
	[float3] [float] NULL,
	[float4] [float] NULL,
	[float5] [float] NULL,
	[float6] [float] NULL,
	[float7] [float] NULL,
	[float8] [float] NULL,
	[float9] [float] NULL,
	[float10] [float] NULL,
	[float11] [float] NULL,
	[float12] [float] NULL,
	[datetime1] [datetime] NULL,
	[datetime2] [datetime] NULL,
	[datetime3] [datetime] NULL,
	[datetime4] [datetime] NULL,
	[datetime5] [datetime] NULL,
	[datetime6] [datetime] NULL,
	[datetime7] [datetime] NULL,
	[datetime8] [datetime] NULL,
	[bit1] [bit] NULL,
	[bit2] [bit] NULL,
	[bit3] [bit] NULL,
	[bit4] [bit] NULL,
	[bit5] [bit] NULL,
	[bit6] [bit] NULL,
	[bit7] [bit] NULL,
	[bit8] [bit] NULL,
	[bit9] [bit] NULL,
	[bit10] [bit] NULL,
	[bit11] [bit] NULL,
	[bit12] [bit] NULL,
	[bit13] [bit] NULL,
	[bit14] [bit] NULL,
	[bit15] [bit] NULL,
	[bit16] [bit] NULL,
	[uniqueidentifier1] [uniqueidentifier] NULL,
	[tp_Level] [tinyint] NOT NULL,
	[tp_IsCurrentVersion] [bit] NOT NULL,
	[tp_UIVersion] [int] NOT NULL,
	[tp_CalculatedVersion] [int] NOT NULL,
	[tp_UIVersionString]  AS ((CONVERT([nvarchar],[tp_UIVersion]/(512),0)+'.')+CONVERT([nvarchar],[tp_UIVersion]%(512),0)),
	[tp_DraftOwnerId] [int] NULL,
	[tp_CheckoutUserId] [int] NULL,
 CONSTRAINT [AllUserData_PK] PRIMARY KEY NONCLUSTERED 
(
	[tp_ListId] ASC,
	[tp_ID] ASC,
	[tp_CalculatedVersion] ASC,
	[tp_Level] ASC,
	[tp_RowOrdinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AllUserData_Url] UNIQUE CLUSTERED 
(
	[tp_SiteId] ASC,
	[tp_DeleteTransactionId] ASC,
	[tp_IsCurrentVersion] ASC,
	[tp_DirName] ASC,
	[tp_LeafName] ASC,
	[tp_CalculatedVersion] ASC,
	[tp_Level] ASC,
	[tp_RowOrdinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((0)) FOR [tp_RowOrdinal]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((0)) FOR [tp_HasAttachment]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((0)) FOR [tp_ModerationStatus]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((1)) FOR [tp_IsCurrent]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT (newid()) FOR [tp_GUID]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT (NULL) FOR [tp_CopySource]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((0)) FOR [tp_HasCopyDestinations]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((0)) FOR [tp_Size]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT (0x) FOR [tp_DeleteTransactionId]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT ((1)) FOR [tp_Level]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT (CONVERT([bit],(1),0)) FOR [tp_IsCurrentVersion]
ALTER TABLE [dbo].[AllUserData] ADD  CONSTRAINT [AllUserData_DEFAULT_UIVersion]  DEFAULT ((512)) FOR [tp_UIVersion]
ALTER TABLE [dbo].[AllUserData] ADD  CONSTRAINT [AllUserData_DEFAULT_CalculatedVersion]  DEFAULT ((0)) FOR [tp_CalculatedVersion]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT (NULL) FOR [tp_DraftOwnerId]
ALTER TABLE [dbo].[AllUserData] ADD  DEFAULT (NULL) FOR [tp_CheckoutUserId]
/****** Object:  Trigger [dbo].[trigger_OnDeleteUserData]    Script Date: 5/15/2018 12:05:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER trigger_OnDeleteUserData ON AllUserData FOR DELETE
AS
    DECLARE @cSave int
    DECLARE @SiteId uniqueidentifier
    DECLARE @cbDelta bigint
    SELECT
        @SiteId = tp_SiteId,
        @cbDelta = -(SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT)))
    FROM
        Deleted
    WHERE
        tp_DeleteTransactionId = 0x
    GROUP BY
        tp_SiteId
    SET @cSave = @@ROWCOUNT
    IF (@cSave = 1)
    BEGIN
        EXEC proc_AppendSiteQuota @SiteId, @cbDelta, 1
    END

GO
