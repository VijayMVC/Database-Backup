/****** Object:  Table [dbo].[AllDocs]    Script Date: 5/15/2018 12:05:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AllDocs](
	[Id] [uniqueidentifier] NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[DirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[WebId] [uniqueidentifier] NOT NULL,
	[ListId] [uniqueidentifier] NULL,
	[DoclibRowId] [int] NULL,
	[Type] [tinyint] NOT NULL,
	[Size] [int] NULL,
	[MetaInfoSize] [int] NULL,
	[Version] [int] NULL,
	[UIVersion] [int] NOT NULL,
	[Dirty] [bit] NULL,
	[ListDataDirty] [bit] NOT NULL,
	[CacheParseId] [uniqueidentifier] NULL,
	[DocFlags] [int] NULL,
	[ThicketFlag] [bit] NULL,
	[CharSet] [int] NULL,
	[ProgId] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TimeCreated] [datetime] NOT NULL,
	[TimeLastModified] [datetime] NOT NULL,
	[NextToLastTimeModified] [datetime] NULL,
	[MetaInfoTimeLastModified] [datetime] NULL,
	[TimeLastWritten] [datetime] NULL,
	[DeleteTransactionId] [varbinary](16) NOT NULL,
	[SetupPathVersion] [tinyint] NOT NULL,
	[SetupPath] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SetupPathUser] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[CheckoutUserId] [int] NULL,
	[CheckoutDate] [datetime] NULL,
	[CheckoutExpires] [datetime] NULL,
	[VersionCreatedSinceSTCheckout] [bit] NOT NULL,
	[LTCheckoutUserId]  AS (case when ([DocFlags]&(32))=(32) then [CheckoutUserId]  end),
	[VirusVendorID] [int] NULL,
	[VirusStatus] [int] NULL,
	[VirusInfo] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[MetaInfo] [image] NULL,
	[UnVersionedMetaInfo] [image] NULL,
	[UnVersionedMetaInfoSize] [int] NULL,
	[UnVersionedMetaInfoVersion] [int] NULL,
	[WelcomePageUrl] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[WelcomePageParameters] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[IsCurrentVersion] [bit] NOT NULL,
	[Level] [tinyint] NOT NULL,
	[CheckinComment] [nvarchar](1023) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[AuditFlags] [int] NULL,
	[InheritAuditFlags] [int] NULL,
	[DraftOwnerId] [int] NULL,
	[UIVersionString]  AS ((CONVERT([nvarchar],[UIVersion]/(512),0)+'.')+CONVERT([nvarchar],[UIVersion]%(512),0)),
	[ParentId] [uniqueidentifier] NOT NULL,
	[HasStream]  AS (case when [Type]=(0) AND ([DocFlags]&(256))=(256) AND [SetupPath] IS NULL OR [SetupPath] IS NOT NULL AND ([DocFlags]&(64))=(64) then (1) else (0) end),
	[ScopeId] [uniqueidentifier] NOT NULL,
	[BuildDependencySet] [image] NULL,
	[ParentVersion] [int] NULL,
	[ParentVersionString]  AS ((CONVERT([nvarchar],[ParentVersion]/(512),0)+'.')+CONVERT([nvarchar],[ParentVersion]%(512),0)),
	[TransformerId] [uniqueidentifier] NULL,
	[ParentLeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[IsCheckoutToLocal]  AS (case when ([DocFlags]&(512))=(512) then (1) else (0) end),
	[CtoOffset] [smallint] NULL,
	[Extension]  AS (case when charindex(N'.',[LeafName] collate Latin1_General_BIN)>(0) then right([LeafName],charindex(N'.',reverse([LeafName]) collate Latin1_General_BIN)-(1)) else N'' end),
	[ExtensionForFile]  AS (case when [Type]=(0) AND charindex(N'.',[LeafName] collate Latin1_General_BIN)>(0) then right([LeafName],charindex(N'.',reverse([LeafName]) collate Latin1_General_BIN)-(1)) else N'' end),
	[ItemChildCount] [int] NOT NULL,
	[FolderChildCount] [int] NOT NULL,
 CONSTRAINT [AllDocs_PK] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC,
	[DeleteTransactionId] ASC,
	[DirName] ASC,
	[LeafName] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [Docs_IdLevelUnique] UNIQUE NONCLUSTERED 
(
	[Id] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[AllDocs] ADD  CONSTRAINT [DEFAULT_UIVersion]  DEFAULT ((512)) FOR [UIVersion]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((0)) FOR [ListDataDirty]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((0)) FOR [ThicketFlag]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT (0x) FOR [DeleteTransactionId]
ALTER TABLE [dbo].[AllDocs] ADD  CONSTRAINT [setuppathversion_default]  DEFAULT ((3)) FOR [SetupPathVersion]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((0)) FOR [VersionCreatedSinceSTCheckout]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((1)) FOR [IsCurrentVersion]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((1)) FOR [Level]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((0)) FOR [ItemChildCount]
ALTER TABLE [dbo].[AllDocs] ADD  DEFAULT ((0)) FOR [FolderChildCount]
/****** Object:  Trigger [dbo].[trigger_OnDeleteDocs]    Script Date: 5/15/2018 12:05:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER trigger_OnDeleteDocs ON AllDocs AFTER DELETE
AS
    DECLARE @SiteId uniqueidentifier
    DECLARE @cbDelta bigint
    DECLARE @cSave int
    SELECT
        @SiteId = SiteId,
        @cbDelta = -SUM(CAST(ISNULL(Size, 0) AS BIGINT) +
            CAST(ISNULL(MetaInfoSize, 0) AS BIGINT)+
            CAST(152 AS BIGINT) +
            CAST(ISNULL(UnVersionedMetaInfoSize,0) AS BIGINT))
    FROM
        Deleted
    WHERE
        DeleteTransactionId = 0x
    GROUP BY
        SiteId
    SET @cSave = @@ROWCOUNT
    IF (@cSave = 1)
    BEGIN
        EXEC proc_AppendSiteQuota @SiteId, @cbDelta, 1
    END

GO
