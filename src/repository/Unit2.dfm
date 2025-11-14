object DataModule2: TDataModule2
  OnCreate = DataModuleCreate
  Height = 658
  Width = 1125
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=logix'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 280
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 128
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabri\OneDrive\Documents\Embarcadero\Studio\Projects\Pr' +
      'ojeto-Logix\lib\libpq.dll'
    Left = 416
    Top = 48
  end
  object frxReportFaturamento: TfrxReport
    Version = '2026.1.0'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45967.414728171300000000
    ReportOptions.LastChange = 45975.437770543980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (<frxDBDatasetFaturamento."nome"> = '#39#39') then'
      '  begin'
      '    MasterData1.Visible := False;'
      '  end'
      '  else'
      '  begin'
      '    MasterData1.Visible := True;'
      '  end;'
      'end;'
      ''
      'begin'
      'end.')
    Left = 73
    Top = 336
    Datasets = <
      item
        DataSet = frxDBDatasetFaturamento
        DataSetName = 'frxDBDatasetFaturamento'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'MasterData1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 16.000000000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409912109375000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relatorio de faturamento por cliente')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 64.000000000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 740.409448818898000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 68.516510610000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'id_cliente')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 68.516510610000000000
          Width = 190.435860680000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'nome')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 258.952371280000000000
          Width = 99.928433600000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'cpf')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 385.337514880000000000
          Width = 185.197332310000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'email')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 585.652967190000000000
          Width = 154.756481630000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Faturamento por cliente')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015771460000000000
        Top = 120.000000000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDatasetFaturamento
        DataSetName = 'frxDBDatasetFaturamento'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 68.516510610000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFaturamento
          DataSetName = 'frxDBDatasetFaturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFaturamento."id_cliente"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 68.516510610000000000
          Width = 190.435860680000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFaturamento
          DataSetName = 'frxDBDatasetFaturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFaturamento."nome"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 258.952371280000000000
          Width = 118.826083600000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cpf'
          DataSet = frxDBDatasetFaturamento
          DataSetName = 'frxDBDatasetFaturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFaturamento."cpf"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 385.337514880000000000
          Width = 215.433572310000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'email'
          DataSet = frxDBDatasetFaturamento
          DataSetName = 'frxDBDatasetFaturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFaturamento."email"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 615.889207190000000000
          Width = 124.520241630000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'valor_pedido'
          DataSet = frxDBDatasetFaturamento
          DataSetName = 'frxDBDatasetFaturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFaturamento."valor_pedido"]')
          ParentFont = False
          Style = 'Data'
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 0.000000100000000000
          Top = 26.456711460000000000
          Width = 737.008322720000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 232.000000000000000000
        Width = 740.409927000000000000
        object Memo14: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 11.338590000000000000
          Width = 740.409912109375000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 176.000000000000000000
        Width = 740.409927000000000000
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 53.398390610000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
          Style = 'Header'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 7.559060000000000000
          Width = 241.685671630000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFaturamento
          DataSetName = 'frxDBDatasetFaturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frxDBDatasetFaturamento."total_geral"> <> 0, <frxDBDataset' +
              'Faturamento."total_geral">, '#39#39')]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409912109375000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
    end
  end
  object FDQueryFaturamento: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SET search_path TO rota_certa_logistica, public;'
      ''
      'SELECT c.id_cliente, '
      '       c.nome, '
      '       c.cpf, '
      '       c.email, '
      '       p.id_pedido, '
      '       p.preco AS valor_pedido, '
      '       NULL AS total_geral'
      'FROM public.cliente c'
      'JOIN pedido p ON p.id_cliente = c.id_cliente'
      'WHERE CAST(p.data_pedido AS DATE) = '#39'2025-11-04'#39
      ''
      'UNION ALL'
      ''
      
        'SELECT NULL, NULL, NULL, NULL, NULL, NULL, SUM(p.preco) AS total' +
        '_geral'
      'FROM public.cliente c'
      'JOIN pedido p ON p.id_cliente = c.id_cliente'
      'WHERE CAST(p.data_pedido AS DATE) = '#39'2025-11-04'#39
      ''
      'ORDER BY id_pedido;')
    Left = 64
    Top = 480
    object FDQueryFaturamentoid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
    end
    object FDQueryFaturamentonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 90
    end
    object FDQueryFaturamentocpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object FDQueryFaturamentoemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 90
    end
    object FDQueryFaturamentototal_geral: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total_geral'
      Origin = 'total_geral'
      ReadOnly = True
      Precision = 64
      Size = 64
    end
    object FDQueryFaturamentoid_pedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ReadOnly = True
    end
    object FDQueryFaturamentovalor_pedido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_pedido'
      Origin = 'valor_pedido'
      ReadOnly = True
      Precision = 64
      Size = 64
    end
  end
  object frxDBDatasetFaturamento: TfrxDBDataset
    UserName = 'frxDBDatasetFaturamento'
    CloseDataSource = False
    DataSet = FDQueryFaturamento
    BCDToCurrency = False
    DataSetOptions = []
    Left = 73
    Top = 408
    FieldDefs = <
      item
        FieldName = 'id_cliente'
      end
      item
        FieldName = 'nome'
        FieldType = fftString
        Size = 90
      end
      item
        FieldName = 'cpf'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'email'
        FieldType = fftString
        Size = 90
      end
      item
        FieldName = 'total_geral'
        Size = 64
      end
      item
        FieldName = 'id_pedido'
      end
      item
        FieldName = 'valor_pedido'
        Size = 64
      end>
  end
  object FDQueryTimeCarreg: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      ' SET search_path TO rota_certa_logistica, public;'
      ''
      '-- Mostra todos os carregamentos (Formato HH:MM)'
      'SELECT '
      '    u.id_usuario AS id_carregador,'
      '    u.nome AS nome_carregador,'
      '    c.id_carregamento,'
      '    c.data_hora_inicio,'
      '    c.data_hora_fim,'
      '    '
      '    -- IN'#205'CIO DA MUDAN'#199'A: Constr'#243'i a string '#39'HH:MM'#39
      '    ('
      
        '        -- LPAD = Adiciona '#39'0'#39' '#224' esquerda se o n'#250'mero tiver meno' +
        's de 2 d'#237'gitos'
      
        '        LPAD(FLOOR(EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_' +
        'hora_inicio)) / 3600)::text, 2, '#39'0'#39') || '#39':'#39' ||'
      
        '        LPAD(FLOOR((EXTRACT(EPOCH FROM (c.data_hora_fim - c.data' +
        '_hora_inicio)) % 3600) / 60)::text, 2, '#39'0'#39')'
      '    )::text AS tempo_hh_mm,'
      '    -- FIM DA MUDAN'#199'A'
      '    '
      
        '    NULL::text AS media_geral_hh_mm -- Coluna da m'#233'dia (nula par' +
        'a esta parte)'
      ''
      'FROM carregamento c'
      'JOIN public.usuarios u ON u.id_usuario = c.id_carregador'
      'WHERE c.data_hora_inicio IS NOT NULL'
      '  AND c.data_hora_fim IS NOT NULL'
      '  AND u.id_usuario = 11'
      ''
      'UNION ALL'
      ''
      '-- Linha de m'#233'dia total (Formato HH:MM)'
      'SELECT '
      '    u.id_usuario AS id_carregador,'
      '    u.nome AS nome_carregador,'
      '    NULL AS id_carregamento,'
      '    NULL AS data_hora_inicio,'
      '    NULL AS data_hora_fim,'
      
        '    NULL::text AS tempo_hh_mm, -- Coluna individual (nula para e' +
        'sta parte)'
      '    '
      '    -- IN'#205'CIO DA MUDAN'#199'A: Calcula a m'#233'dia e formata para '#39'HH:MM'#39
      '    ('
      
        '        LPAD(FLOOR(AVG(EXTRACT(EPOCH FROM (c.data_hora_fim - c.d' +
        'ata_hora_inicio))) / 3600)::text, 2, '#39'0'#39') || '#39':'#39' ||'
      
        '        LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (c.data_hora_fim - c.' +
        'data_hora_inicio))) % 3600) / 60)::text, 2, '#39'0'#39')'
      '    )::text AS media_geral_hh_mm'
      '    -- FIM DA MUDAN'#199'A'
      '    '
      'FROM carregamento c'
      'JOIN public.usuarios u ON u.id_usuario = c.id_carregador'
      'WHERE c.data_hora_inicio IS NOT NULL'
      '  AND c.data_hora_fim IS NOT NULL'
      '  AND u.id_usuario = 11'
      'GROUP BY u.id_usuario, u.nome'
      ''
      'ORDER BY data_hora_inicio NULLS LAST;')
    Left = 362
    Top = 488
    object FDQueryTimeCarregid_carregador: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_carregador'
      Origin = 'id_carregador'
      ReadOnly = True
    end
    object FDQueryTimeCarregnome_carregador: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_carregador'
      Origin = 'nome_carregador'
      ReadOnly = True
      Size = 90
    end
    object FDQueryTimeCarregid_carregamento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_carregamento'
      Origin = 'id_carregamento'
      ReadOnly = True
    end
    object FDQueryTimeCarregdata_hora_inicio: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_hora_inicio'
      Origin = 'data_hora_inicio'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object FDQueryTimeCarregdata_hora_fim: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_hora_fim'
      Origin = 'data_hora_fim'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object FDQueryTimeCarregtempo_hh_mm: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tempo_hh_mm'
      Origin = 'tempo_hh_mm'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object FDQueryTimeCarregmedia_geral_hh_mm: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'media_geral_hh_mm'
      Origin = 'media_geral_hh_mm'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object frxDBDatasetTimeCarreg: TfrxDBDataset
    UserName = 'frxDBDatasetTimeCarreg'
    CloseDataSource = False
    DataSet = FDQueryTimeCarreg
    BCDToCurrency = False
    DataSetOptions = []
    Left = 362
    Top = 416
  end
  object frxReportTimecarreg: TfrxReport
    Version = '2026.1.0'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45971.642065879600000000
    ReportOptions.LastChange = 45972.612424664350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  // Verifica se o campo que voc'#234' usa para o IF est'#225' vazio ou nu' +
        'lo'
      
        '  // (Use "tempo_hh_mm" ou "id_carregamento", o que for nulo nas' +
        ' linhas de m'#233'dia)'
      '  if <frxDBDatasetTimeCarreg."tempo_hh_mm"> = '#39#39' then'
      '  begin'
      '    // Torna a banda MasterData1 (a linha inteira) invis'#237'vel'
      '    MasterData1.Visible := False;'
      '  end'
      '  else'
      '  begin'
      
        '    // Caso contr'#225'rio, garante que ela seja vis'#237'vel (para as lin' +
        'has de dados)'
      '    MasterData1.Visible := True;'
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 370
    Top = 342
    Datasets = <
      item
        DataSet = frxDBDatasetTimeCarreg
        DataSetName = 'frxDBDatasetTimeCarreg'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relatorio de tempo medio por carregamento')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 330.472326220000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome Carregador')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 413.621986220000000000
          Width = 111.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Id Carregamento')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 603.992116220000000000
          Width = 114.118120000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tempo em hora:')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795301460000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetTimeCarreg
        DataSetName = 'frxDBDatasetTimeCarreg'
        RowCount = 0
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 330.472326220000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetTimeCarreg
          DataSetName = 'frxDBDatasetTimeCarreg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frxDBDatasetTimeCarreg."tempo_hh_mm"> <> '#39#39', <frxDBDataset' +
              'TimeCarreg."nome_carregador">, '#39#39')]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 603.992116220000000000
          Top = 3.779530000000000000
          Width = 114.118120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'tempo_hh_mm'
          DataSet = frxDBDatasetTimeCarreg
          DataSetName = 'frxDBDatasetTimeCarreg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetTimeCarreg."tempo_hh_mm"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 3.779530000000000000
          Width = 114.118120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetTimeCarreg
          DataSetName = 'frxDBDatasetTimeCarreg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frxDBDatasetTimeCarreg."id_carregamento"> > 0, <frxDBDatas' +
              'etTimeCarreg."id_carregamento">, '#39#39')]')
          ParentFont = False
          Style = 'Data'
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530100000000000
          Top = 30.236241460000000000
          Width = 710.551624630000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo11: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 559.370457773437500000
          Top = 1.000000000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 197.929190000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Media total por carregamento:')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 7.559060000000000000
          Width = 111.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetTimeCarreg
          DataSetName = 'frxDBDatasetTimeCarreg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetTimeCarreg."media_geral_hh_mm"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
    end
  end
  object FDQueryTimeViagem: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        '-- CEN'#193'RIO 1: Relat'#243'rio para TODOS os motoristas (aIdMotorista =' +
        ' 0)'
      ''
      'SELECT'
      '  u.id_usuario AS id_motorista,'
      '  u.nome AS nome_motorista,'
      '  v.id_viagem,'
      '  v.data_saida_cd,'
      '  v.data_chegada,'
      '  -- CORRE'#199#195'O APLICADA AQUI (removido LPAD das horas)'
      '  ('
      
        '    FLOOR(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd))' +
        ' / 3600)::text || '#39':'#39' ||'
      
        '    LPAD(FLOOR((EXTRACT(EPOCH FROM (v.data_chegada - v.data_said' +
        'a_cd)) % 3600) / 60)::text, 2, '#39'0'#39')'
      '  )::text AS tempo_hh_mm,'
      '  NULL::text AS media_geral_hh_mm'
      'FROM'
      '  rota_certa_logistica.viagem v -- Substitua pelo seu schema'
      '  JOIN public.usuarios u ON u.id_usuario = v.id_motorista'
      'WHERE'
      '  v.data_saida_cd IS NOT NULL'
      '  AND v.data_chegada IS NOT NULL'
      '  '
      'UNION ALL'
      ''
      '-- M'#233'dia por Motorista'
      'SELECT'
      '  u.id_usuario AS id_motorista,'
      '  u.nome AS nome_motorista,'
      '  NULL::integer AS id_viagem,'
      '  NULL::timestamp AS data_saida_cd,'
      '  NULL::timestamp AS data_chegada,'
      '  NULL::text AS tempo_hh_mm,'
      '  -- CORRE'#199#195'O APLICADA AQUI (removido LPAD das horas)'
      '  ('
      
        '    FLOOR(AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_' +
        'cd))) / 3600)::text || '#39':'#39' ||'
      
        '    LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_' +
        'saida_cd))) % 3600) / 60)::text, 2, '#39'0'#39')'
      '  )::text AS media_geral_hh_mm'
      'FROM'
      '  rota_certa_logistica.viagem v -- Substitua pelo seu schema'
      '  JOIN public.usuarios u ON u.id_usuario = v.id_motorista'
      'WHERE'
      '  v.data_saida_cd IS NOT NULL'
      '  AND v.data_chegada IS NOT NULL'
      'GROUP BY'
      '  u.id_usuario,'
      '  u.nome'
      '  '
      'UNION ALL'
      ''
      '-- M'#233'dia Geral'
      'SELECT'
      '  NULL::integer AS id_motorista,'
      '  '#39'M'#201'DIA GERAL'#39' AS nome_motorista,'
      '  NULL::integer AS id_viagem,'
      '  NULL::timestamp AS data_saida_cd,'
      '  NULL::timestamp AS data_chegada,'
      '  NULL::text AS tempo_hh_mm,'
      '  -- CORRE'#199#195'O APLICADA AQUI (removido LPAD das horas)'
      '  ('
      
        '    FLOOR(AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_' +
        'cd))) / 3600)::text || '#39':'#39' ||'
      
        '    LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_' +
        'saida_cd))) % 3600) / 60)::text, 2, '#39'0'#39')'
      '  )::text AS media_geral_hh_mm'
      'FROM'
      '  rota_certa_logistica.viagem v -- Substitua pelo seu schema'
      'WHERE'
      '  v.data_saida_cd IS NOT NULL'
      '  AND v.data_chegada IS NOT NULL'
      ''
      'ORDER BY'
      '  nome_motorista NULLS LAST,'
      '  data_saida_cd NULLS LAST;')
    Left = 670
    Top = 492
    object FDQueryTimeViagemid_motorista: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_motorista'
      Origin = 'id_motorista'
      ReadOnly = True
    end
    object FDQueryTimeViagemnome_motorista: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_motorista'
      Origin = 'nome_motorista'
      ReadOnly = True
      Size = 8190
    end
    object FDQueryTimeViagemid_viagem: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_viagem'
      Origin = 'id_viagem'
      ReadOnly = True
    end
    object FDQueryTimeViagemdata_saida_cd: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_saida_cd'
      Origin = 'data_saida_cd'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object FDQueryTimeViagemdata_chegada: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_chegada'
      Origin = 'data_chegada'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object FDQueryTimeViagemtempo_hh_mm: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tempo_hh_mm'
      Origin = 'tempo_hh_mm'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object FDQueryTimeViagemmedia_geral_hh_mm: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'media_geral_hh_mm'
      Origin = 'media_geral_hh_mm'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object frxDBDatasetTimeViagem: TfrxDBDataset
    UserName = 'frxDBDatasetTimeViagem'
    CloseDataSource = False
    DataSet = FDQueryTimeViagem
    BCDToCurrency = False
    DataSetOptions = []
    Left = 670
    Top = 422
    FieldDefs = <
      item
        FieldName = 'id_motorista'
      end
      item
        FieldName = 'nome_motorista'
        FieldType = fftString
        Size = 8190
      end
      item
        FieldName = 'id_viagem'
      end
      item
        FieldName = 'data_saida_cd'
      end
      item
        FieldName = 'data_chegada'
      end
      item
        FieldName = 'tempo_hh_mm'
      end
      item
        FieldName = 'media_geral_hh_mm'
      end>
  end
  object frxReportTimeViagem: TfrxReport
    Version = '2026.1.0'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45972.589072303200000000
    ReportOptions.LastChange = 45975.439115208300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '   '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin  '
      '  if (VarToStr(<frxDBDatasetTimeViagem."tempo_hh_mm">) = '#39#39') or'
      
        '     (VarToStr(<frxDBDatasetTimeViagem."nome_motorista">) = '#39'M'#201'D' +
        'IA GERAL'#39') then'
      '  begin'
      '    MasterData1.Visible := False;'
      '  end'
      '  else'
      '  begin'
      ''
      '    MasterData1.Visible := True;'
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 670
    Top = 352
    Datasets = <
      item
        DataSet = frxDBDatasetTimeViagem
        DataSetName = 'frxDBDatasetTimeViagem'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relatorio de tempo medio de viagens')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 342.020884190000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome motorista:')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 394.934304190000000000
          Width = 69.278282030000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Id viagem')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 592.716606220000000000
          Width = 125.456710000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tempo em horas')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetTimeViagem
        DataSetName = 'frxDBDatasetTimeViagem'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 413.831954190000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetTimeViagem
          DataSetName = 'frxDBDatasetTimeViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[IIF(<frxDBDatasetTimeViagem."tempo_hh_mm"> <> '#39#39', <frxDBDataset' +
              'TimeViagem."nome_motorista">, '#39#39')]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 413.831954190000000000
          Top = 3.779530000000000000
          Width = 69.278282030000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_viagem'
          DataSet = frxDBDatasetTimeViagem
          DataSetName = 'frxDBDatasetTimeViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetTimeViagem."id_viagem"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 611.614256220000000000
          Top = 3.779530000000000000
          Width = 106.559060000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'tempo_hh_mm'
          DataSet = frxDBDatasetTimeViagem
          DataSetName = 'frxDBDatasetTimeViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetTimeViagem."tempo_hh_mm"]')
          ParentFont = False
          Style = 'Data'
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530100000000000
          Top = 26.456708940000000000
          Width = 710.551657680000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo13: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 0.062616220000000000
          Top = 7.559060000000000000
          Width = 170.015770000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tempo medio por viagem:')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Top = 7.559060000000000000
          Width = 136.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'media_geral_hh_mm'
          DataSet = frxDBDatasetTimeViagem
          DataSetName = 'frxDBDatasetTimeViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetTimeViagem."media_geral_hh_mm"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
    end
  end
  object FDQueryRelCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '    p.id_pedido,'
      '    p.status,'
      '    p.data_pedido,'
      '    t.id AS transportadora_id,'
      '    t.nome AS transportadora_nome,'
      '    c.nome AS cliente_nome  '
      'FROM'
      '    rota_certa_logistica.pedido p'
      'JOIN'
      '    public.transportadora t ON t.id = p.id_transportadora'
      'JOIN'
      '    public.cliente c ON c.id_cliente = p.id_cliente  '
      'WHERE'
      '    p.id_cliente = 1'
      'ORDER BY'
      '    p.data_pedido DESC;')
    Left = 986
    Top = 396
    object FDQueryRelClientenspname: TWideStringField
      FieldName = 'nspname'
      Origin = 'nspname'
      Size = 64
    end
    object FDQueryRelClienteid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDQueryRelClientenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 90
    end
    object FDQueryRelClientetotal_pedidos: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total_pedidos'
      Origin = 'total_pedidos'
      ReadOnly = True
    end
    object FDQueryRelClienteid_pedido: TIntegerField
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryRelClientestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
    end
    object FDQueryRelClientedata_pedido: TSQLTimeStampField
      FieldName = 'data_pedido'
      Origin = 'data_pedido'
      ProviderFlags = [pfInUpdate]
    end
    object FDQueryRelClientetransportadora_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'transportadora_id'
      Origin = 'transportadora_id'
    end
    object FDQueryRelClientetransportadora_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'transportadora_nome'
      Origin = 'transportadora_nome'
      Size = 90
    end
    object FDQueryRelClientecliente_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_nome'
      Origin = 'cliente_nome'
      Size = 90
    end
  end
  object frxDBDatasetRelCliente: TfrxDBDataset
    UserName = 'frxDBDatasetRelCliente'
    CloseDataSource = False
    DataSet = FDQueryRelCliente
    BCDToCurrency = False
    DataSetOptions = []
    Left = 986
    Top = 336
  end
  object frxReportRelCliente: TfrxReport
    Version = '2026.1.0'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45974.454889432900000000
    ReportOptions.LastChange = 45974.477845127320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 984
    Top = 248
    Datasets = <
      item
        DataSet = frxDBDatasetRelCliente
        DataSetName = 'frxDBDatasetRelCliente'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409912109375000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relatorio de pedidos do cliente')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Width = 687.496492110000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[frxDBDatasetRelCliente."cliente_nome"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 204.094620000000000000
        Width = 740.409927000000000000
        KeepWithData = False
        Condition = 'frxDBDatasetRelCliente."transportadora_nome"'
        object Memo8: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 7.559060000000000000
          Width = 634.583072109375000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'transportadora_nome'
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[frxDBDatasetRelCliente."transportadora_nome"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            'Transportadora:')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 268.346630000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDatasetRelCliente
        DataSetName = 'frxDBDatasetRelCliente'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 0.291280000000000000
          Width = 72.822563130000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id_pedido'
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetRelCliente."id_pedido"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 228.074573130000000000
          Width = 262.686773440000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'status'
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetRelCliente."status"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 490.761346570000000000
          Width = 249.648565540000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_pedido'
          DataSet = frxDBDatasetRelCliente
          DataSetName = 'frxDBDatasetRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetRelCliente."data_pedido"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 317.480520000000000000
        Width = 740.409927000000000000
        KeepWithData = False
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 377.953000000000000000
        Width = 740.409927000000000000
        object Memo14: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 740.409912109375000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo16: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 664.819312109375000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 158.740260000000000000
        Width = 740.409927000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Width = 72.822563130000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Id pedido')
          ParentFont = False
          Style = 'Header'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 227.783293130000000000
          Width = 261.675280310000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
          ParentFont = False
          Style = 'Header'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 489.458573440000000000
          Width = 250.951338670000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data pedido')
          ParentFont = False
          Style = 'Header'
        end
      end
    end
  end
  object frxPDFExportRelCliente: TfrxPDFExport
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 984
    Top = 184
  end
  object frxPDFExportFaturamento: TfrxPDFExport
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 88
    Top = 272
  end
  object frxPDFExportTimeCarreg: TfrxPDFExport
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 368
    Top = 256
  end
  object frxPDFExportTimeViagem: TfrxPDFExport
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 664
    Top = 272
  end
end
