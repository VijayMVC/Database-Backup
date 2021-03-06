/****** Object:  View [dbo].[AdvQueryNodeXML]    Script Date: 5/15/2018 12:14:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW AdvQueryNodeXML AS SELECT  ID, ClassTypeID, 
        CASE
          WHEN ClassTypeID IN (22701, 22702, 22703) THEN
            'BooleanSection' 
          WHEN ClassTypeID = 22703 THEN
            'MacroSection'
          WHEN ClassTypeID = 22700 THEN
            'CriteriaSection'
          ELSE
            'Error_SectionType ID="' + CAST(ClassTypeID AS varchar(10)) + '"'
        END AS XMLTopNodeName,

        CASE
          WHEN ClassTypeID IN (22701, 22702) THEN
            '<OriginalID>' + CAST(ID AS VarChar(10)) + '</OriginalID>' +
            '<OriginalClassTypeID>' + CAST(ClassTypeID AS VarChar(10)) + '</OriginalClassTypeID>' +
            CASE
              WHEN NodeTableType = 0 THEN
                ''
              ELSE
                '<TableType>' + CAST(COALESCE (NodeTableType, 0) AS VarChar(10)) + '</TableType>' 
            END +
            '<ImageIndex>' + COALESCE (CAST(ImageIndex AS VarChar(10)), '') + '</ImageIndex>' + 
            '<GroupName>' + CAST(COALESCE (GroupID, '') AS VarChar(10)) + '</GroupName>' +
            '<BooleanOperation>' + COALESCE (CAST(Operator AS VarChar(10)), '') + '</BooleanOperation>'

          WHEN ClassTypeID = 22703 THEN
            '<OriginalID>' + CAST(ID AS VarChar(10)) + '</OriginalID>' +
            '<OriginalClassTypeID>' + CAST(ClassTypeID AS VarChar(10)) + '</OriginalClassTypeID>' +
            CASE
              WHEN NodeTableType = 0 THEN
                ''
              ELSE
                '<TableType>' + CAST(COALESCE (NodeTableType, 0) AS VarChar(10)) + '</TableType>'
            END +
            '<ImageIndex>' + COALESCE (CAST(ImageIndex AS VarChar(10)), '') + '</ImageIndex>' +
            '<GroupName>' + CAST(COALESCE (GroupID, '') AS VarChar(10)) + '</GroupName>' +
            '<BooleanOperation>16</BooleanOperation>'
          WHEN ClassTypeID = 22700 THEN
            '<OriginalID>' + CAST(ID AS VarChar(10)) + '</OriginalID>' +
            '<OriginalClassTypeID>' + CAST(ClassTypeID AS VarChar(10)) + '</OriginalClassTypeID>' +
            '<OriginalCriteriaType>' + COALESCE (CAST(CriteriaType AS VarChar(10)), '') + '</OriginalCriteriaType>' +
            '<OriginalValueFormat>' + COALESCE (ValueFormat, '') + '</OriginalValueFormat>' +
            CASE
              WHEN NodeTableType = 0 THEN
                ''
              ELSE
                '<TableType>' + CAST(COALESCE (NodeTableType, 0) AS VarChar(10)) + '</TableType>'
            END +
            '<ImageIndex>' + CAST(COALESCE (ImageIndex, '') AS VarChar(10)) + '</ImageIndex>' +
            '<GroupName>' + CAST(COALESCE (GroupID, '') AS VarChar(10)) + '</GroupName>' +
            '<Caption>' + COALESCE (InstanceDisplayString, '') + '</Caption>' +
            '<DisplayCaption>' + 
            CASE
              WHEN ( NodeText IS NOT NULL ) AND ( NodeText <> '' ) THEN 
                NodeText
              WHEN ( InstanceDisplayString IS NOT NULL ) AND ( InstanceDisplayString <> '' ) THEN 
                InstanceDisplayString
              ELSE 
                Substring(FieldName, 4, 999) + ' is ' + Value1
            END +
            '</DisplayCaption>' +
            '<InputOption>' +
            CASE
              WHEN ValueFormat = 'Date' THEN
                CASE
                  WHEN CriteriaType BETWEEN 1 AND 14 THEN
                    '00'
                  WHEN Operator BETWEEN 1 AND 5 THEN
                    '03'
                  WHEN Operator BETWEEN 6 AND 7 THEN
                    '02'
                  ELSE
                    '00'
                END

              WHEN ValueFormat = '''%s''' THEN
                '00'
              WHEN ValueFormat = 'Boolean' THEN
                '00'
              ELSE
                CASE
                  WHEN Operator BETWEEN 1 AND 5 THEN
                    '05'
                  WHEN Operator BETWEEN 6 AND 7 THEN
                    '04'
                  WHEN Operator BETWEEN 10 AND 11 THEN
                    '01'
                  ELSE
                    '00'
                END
            END +
            '</InputOption>' +
            '<IsHavingQuery>' + CAST(COALESCE (FieldAggrFunc, 0) AS VarChar(10)) + '</IsHavingQuery>' +
            '<UseRelativeDates>' + CAST(COALESCE (UseRelativeDate, 0) AS VarChar(2)) + '</UseRelativeDates>' +
            '<Value1>' + COALESCE (REPLACE ( 
                                     REPLACE( CASE
                                                WHEN Value1 = 'PARENT_VALUE1' THEN
                                                  ( SELECT Value1
                                                    FROM   AdvQueryNode A2
                                                    WHERE  A2.ID = A1.ParentID )
                                                ELSE
                                                  Value1
                                              END, '%', '*'), '&apos;', ''), '') + '</Value1>' +
            '<Value2>' + COALESCE (REPLACE( 
                                     REPLACE( CASE
                                                WHEN Value1 = 'PARENT_VALUE2' THEN
                                                  ( SELECT Value2
                                                    FROM   AdvQueryNode A2
                                                    WHERE  A2.ID = A1.ParentID )
                                                ELSE
                                                  Value2
                                              END, '%', '*'), '&apos;', ''), '') + '</Value2>' +
            '<QueryText>' +
            CASE
              WHEN ValueFormat = 'Date' THEN
                CASE
                  WHEN CriteriaType = 1 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%TodayStart%&gt; AND &lt;%TodayEnd%&gt;'
                  WHEN CriteriaType = 2 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%ThisWeekStart%&gt; AND &lt;%ThisWeekEnd%&gt;'
                  WHEN CriteriaType = 3 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%ThisMonthStart%&gt; AND &lt;%ThisMonthEnd%&gt;'
                  WHEN CriteriaType = 4 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%ThisYearStart%&gt; AND &lt;%ThisYearEnd%&gt;'
                  WHEN CriteriaType = 5 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%Past3MonthsStart%&gt; AND &lt;%YesterdayEnd%&gt;'
                  WHEN CriteriaType = 6 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%Past6MonthsStart%&gt; AND &lt;%YesterdayEnd%&gt;'
                  WHEN CriteriaType = 7 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%PastYearStart%&gt; AND &lt;%YesterdayEnd%&gt;'
                  WHEN CriteriaType = 8 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%YesterdayStart%&gt; AND &lt;%YesterdayEnd%&gt;'
                  WHEN CriteriaType = 9 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos; ) BETWEEN &lt;%LastWeekStart%&gt; AND &lt;%LastWeekEnd%&gt;'
                  WHEN CriteriaType = 10 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos;) BETWEEN &lt;%LastMonthStart%&gt; AND &lt;%LastMonthEnd%&gt;'
                  WHEN CriteriaType = 11 THEN
                    'Coalesce(' + FieldName + ', &apos;1/1/1900&apos;) BETWEEN &lt;%LastYearStart%&gt; AND &lt;%LastYearEnd%&gt;'
                  WHEN CriteriaType = 12 THEN
                    FieldName + ' &lt; &lt;%Past3MonthsStart%&gt;'
                  WHEN CriteriaType = 13 THEN
                    FieldName + ' &lt; &lt;%Past6MonthsStart%&gt;'
                  WHEN CriteriaType = 14 THEN
                    FieldName + ' &lt; &lt;%PastYearStart%&gt;'
                  WHEN Operator = 0 THEN
                    FieldName + ' BETWEEN &lt;%DateValue1%&gt; AND &lt;%DateValue2%&gt;'
                  WHEN Operator = 1 THEN
                    FieldName + ' NOT BETWEEN &lt;%DateValue1%&gt; AND &lt;%DateValue2%&gt;'
                  WHEN Operator = 2 THEN
                    FieldName + ' &lt; &lt;%DateValue1%&gt;'
                  WHEN Operator = 3 THEN
                    FieldName + ' &gt;= &lt;%DateValue1%&gt;'
                  WHEN Operator = 4 THEN
                    FieldName + ' &gt; &lt;%DateValue1%&gt;'
                  WHEN Operator = 5 THEN
                    FieldName + ' &lt;= &lt;%DateValue1%&gt;'
                  WHEN Operator = 6 THEN
                    FieldName + ' BETWEEN &lt;%DateValue1%&gt; AND &lt;%DateValue2%&gt;'
                  WHEN Operator = 7 THEN
                    FieldName + ' NOT BETWEEN &lt;%DateValue1%&gt; AND &lt;%DateValue2%&gt;'
                  WHEN Operator = 12 THEN
                    FieldName + ' IS NULL '
                  WHEN Operator = 13 THEN
                    FieldName + ' IS NOT NULL '
                  ELSE
                    'Unknown Date Operator ' + COALESCE (CAST(Operator AS VarChar(5)), 'NULL')
                END
              WHEN ValueFormat = 'Boolean' THEN
                CASE
                  WHEN Operator = 0 THEN
                    'Coalesce(' + FieldName + ', 0) = &lt;%' + Value1 + '%&gt;'
                  WHEN Operator = 1 THEN
                    'Coalesce(' + FieldName + ', 0) &lt;&gt; &lt;%' + Value1 + '%&gt;'
                  WHEN Operator = 12 THEN
                    FieldName + ' IS NULL'
                  WHEN Operator = 13 THEN
                    FieldName + ' IS NOT NULL'
                  ELSE
                    'Unknown Boolean Operator ' + COALESCE (CAST(Operator AS VarChar(5)), 'NULL')
                END
              WHEN ValueFormat = '''%s''' THEN
                CASE
                  WHEN Operator = 0 THEN
                    FieldName + ' = &apos;&lt;%StringValue1%&gt;&apos;'
                  WHEN Operator = 10 THEN
                    FieldName + ' LIKE &apos;%&lt;%StringValue1%&gt;&apos;'
                  WHEN Operator = 11 THEN
                    FieldName + ' NOT LIKE &apos;&lt;%StringValue1%&gt;&apos;'
                  ELSE
                    'Unknown Number or String Operator ' + COALESCE (CAST(Operator AS VarChar(5)), 'NULL') 
                  END
              ELSE
                CASE
                  WHEN Operator = 0 THEN
                    'Coalesce(' + FieldName + ', 0) = &lt;%NumberValue1%&gt;'
                  WHEN Operator = 1 THEN
                    'Coalesce(' + FieldName + ', 0)  &lt;&gt; &lt;%NumberValue1%&gt;'
                  WHEN Operator = 2 THEN
                    'Coalesce(' + FieldName + ', 0)  &lt; &lt;%NumberValue1%&gt;'
                  WHEN Operator = 3 THEN
                    'Coalesce(' + FieldName + ', 0)  &gt;= &lt;%NumberValue1%&gt;'
                  WHEN Operator = 4 THEN
                    'Coalesce(' + FieldName + ', 0)  &gt; &lt;%NumberValue1%&gt;'
                  WHEN Operator = 5 THEN
                    'Coalesce(' + FieldName + ', 0)  &lt;= &lt;%NumberValue1%&gt;'
                  WHEN Operator = 6 THEN
                    'Coalesce(' + FieldName + ', 0)  BETWEEN &lt;%NumberValue1%&gt; AND &lt;%NumberValue2%&gt;'
                  WHEN Operator = 7 THEN
                    'Coalesce(' + FieldName + ', 0)  NOT BETWEEN &lt;%NumberValue1%&gt; AND &lt;%NumberValue2%&gt;'
                  WHEN Operator = 8 THEN
                    FieldName + ' IN (&lt;%NumberValue1%&gt;)'
                  WHEN Operator = 9 THEN
                    FieldName + ' NOT IN (&lt;%NumberValue1%&gt;)'
                  WHEN Operator = 10 THEN
                    FieldName + ' LIKE &apos;&lt;%StringValue1%&gt;&apos;'
                  WHEN Operator = 11 THEN
                    FieldName + ' NOT LIKE &apos;&lt;%StringValue1%&gt;&apos;'
                  WHEN Operator = 12 THEN
                    FieldName + ' IS NULL'
                  WHEN Operator = 13 THEN
                    FieldName + ' IS NOT NULL'
                  WHEN Operator = 14 THEN
                    'NOT (' + FieldName + ' IS NULL OR ' + FieldName + ' = &apos;&apos; )'
                  WHEN Operator = 15 THEN
                    '(' + FieldName + ' IS NULL OR ' + FieldName + ' = &apos;&apos; )'
                  ELSE
                    'Unknown Number or String Operator ' + COALESCE (CAST(Operator AS VarChar(5)), 'NULL') 
                END 
            END +
            ' </QueryText>'
          ELSE
            '<Error_UnknownClassType ID="' + CAST(ID AS varchar(2)) + '" CLASSTYPEID="' + CAST(ClassTypeID AS VarChar(20)) + '" />"' 
        END AS XMLData

FROM        
(
SELECT     ID, StoreID, ClassTypeID, IsActive, 
           dbo.TextToXML(NodeText) as NodeText,
           dbo.TextToXML(DefinitionDisplayString) as DefinitionDisplayString, 
           dbo.TextToXML(InstanceDisplayString) as InstanceDisplayString, 
           dbo.TextToXML(Value1) as Value1, 
           dbo.TextToXML(Value2) as Value2,

           ParentID, ParentClassTypeID, ImageIndex, SortIndex, NodeTableType, Operator, 
           NodeTableName, 
           FieldName, 
           FieldAggrFunc, 
           FieldAliasName, 
           FieldSelectionIndex, 
           FieldOrderByIndex, 
           UseRelativeDate, 
           InputOption, 
           BuilderOptions, 
           SpawnIntoParentCategory, 
           VirtualQueryName, 
           CriteriaType, 
           CriteriaImageIndex, 
           GroupID, 
           QueryFieldNameForDisplay, 
           QueryFieldNameForValue1, 
           QueryFieldNameForValue2,
           ValueFormat, 
           FieldFormat

FROM       AdvQueryNode
)
AS A1

GO
