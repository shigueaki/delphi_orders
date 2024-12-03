object formReports: TformReports
  Left = 0
  Top = 0
  Caption = 'Reports'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 168
    Top = 160
    Width = 265
    Height = 97
    Caption = 'Generate Report'
    TabOrder = 0
  end
  object frxReport1: TfrxReport
    Version = '2025.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45629.083430787000000000
    ReportOptions.LastChange = 45629.088688125000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 272
    Top = 304
    Datasets = <
      item
        DataSet = cdsOrders
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = cdsItens
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = cdsOrders
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object MemofrxDBDataset1Id: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Id'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Id"]')
        end
        object MemofrxDBDataset1IdClient: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'IdClient'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."IdClient"]')
        end
        object MemofrxDBDataset1Total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 90.708720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Total'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Total"]')
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = cdsItens
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object MemofrxDBDataset1Id1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Id'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Id"]')
        end
        object MemofrxDBDataset1IdOrder: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'IdOrder'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."IdOrder"]')
        end
      end
      object SubdetailData1: TfrxSubdetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 75.590600000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        DataSet = cdsItens
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object MemofrxDBDataset1IdProduct: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'IdProduct'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."IdProduct"]')
        end
        object MemofrxDBDataset1Quantity: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Quantity'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Quantity"]')
        end
        object MemofrxDBDataset1UnitPrice: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'UnitPrice'
          DataSet = cdsOrders
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."UnitPrice"]')
        end
      end
    end
  end
  object tbOrders: TFDTable
    Active = True
    IndexFieldNames = 'Id'
    Connection = TConMinerva.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'minerva.dbo.tb_orders'
    Left = 464
    Top = 24
    object tbOrdersId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tbOrdersIdClient: TIntegerField
      FieldName = 'IdClient'
      Origin = 'IdClient'
      Required = True
    end
    object tbOrdersCreatedAt: TSQLTimeStampField
      FieldName = 'CreatedAt'
      Origin = 'CreatedAt'
    end
    object tbOrdersTotal: TFMTBCDField
      FieldName = 'Total'
      Origin = 'Total'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object tbItens: TFDTable
    Active = True
    IndexFieldNames = 'Id'
    Connection = TConMinerva.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'minerva.dbo.tb_order_itens'
    Left = 544
    Top = 32
    object tbItensId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tbItensIdOrder: TIntegerField
      FieldName = 'IdOrder'
      Origin = 'IdOrder'
      Required = True
    end
    object tbItensIdProduct: TIntegerField
      FieldName = 'IdProduct'
      Origin = 'IdProduct'
      Required = True
    end
    object tbItensQuantity: TFMTBCDField
      FieldName = 'Quantity'
      Origin = 'Quantity'
      Required = True
      Precision = 18
      Size = 2
    end
    object tbItensUnitPrice: TFMTBCDField
      FieldName = 'UnitPrice'
      Origin = 'UnitPrice'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dsOrders: TDataSource
    DataSet = tbOrders
    Left = 464
    Top = 88
  end
  object dsItens: TDataSource
    DataSet = tbItens
    Left = 544
    Top = 96
  end
  object cdsOrders: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dsOrders
    BCDToCurrency = False
    DataSetOptions = []
    Left = 464
    Top = 144
    FieldDefs = <
      item
        FieldName = 'Id'
      end
      item
        FieldName = 'IdClient'
      end
      item
        FieldName = 'CreatedAt'
      end
      item
        FieldName = 'Total'
      end>
  end
  object cdsItens: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dsItens
    BCDToCurrency = False
    DataSetOptions = []
    Left = 544
    Top = 160
    FieldDefs = <
      item
        FieldName = 'Id'
      end
      item
        FieldName = 'IdOrder'
      end
      item
        FieldName = 'IdProduct'
      end
      item
        FieldName = 'Quantity'
      end
      item
        FieldName = 'UnitPrice'
      end>
  end
end
