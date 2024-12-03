object formOrders: TformOrders
  Left = 0
  Top = 0
  Caption = 'Orders'
  ClientHeight = 824
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 274
    Height = 54
    Caption = 'Minerva Orders'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 608
    Height = 289
    DataSource = dsItens
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Name'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'value'
        Title.Caption = 'Value'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Title.Caption = 'Quantity'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 88
        Visible = True
      end>
  end
  object edtProduct: TEdit
    Left = 8
    Top = 392
    Width = 425
    Height = 23
    TabOrder = 1
    OnEnter = edtProductEnter
    OnKeyDown = edtProductKeyDown
  end
  object edtQuantity: TEdit
    Left = 448
    Top = 392
    Width = 168
    Height = 23
    TabOrder = 2
    OnEnter = edtQuantityEnter
    OnKeyDown = edtQuantityKeyDown
  end
  object btnAddItem: TButton
    Left = 541
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Add Item'
    TabOrder = 3
    OnClick = btnAddItemClick
  end
  object btnRemoveItem: TButton
    Left = 448
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Remove Item'
    TabOrder = 4
    OnClick = btnRemoveItemClick
  end
  object btnCancel: TButton
    Left = 358
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
  end
  object edtSearchClient: TEdit
    Left = 8
    Top = 472
    Width = 320
    Height = 23
    TabOrder = 6
    TextHint = 'Search client'
    OnChange = edtSearchClientChange
  end
  object dbgRegisteredClients: TDBGrid
    Left = 8
    Top = 501
    Width = 320
    Height = 188
    DataSource = DMclients.dsClients
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Active Clients'
        Visible = True
      end>
  end
  object btnSave: TButton
    Left = 541
    Top = 664
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 8
    OnClick = btnSaveClick
  end
  object dsItens: TDataSource
    DataSet = memItens
    Left = 560
    Top = 24
  end
  object memItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 472
    Top = 24
    object memItensid: TIntegerField
      FieldName = 'id'
    end
    object memItensname: TStringField
      FieldName = 'name'
    end
    object memItensvalue: TCurrencyField
      FieldName = 'value'
    end
    object memItensquantity: TFloatField
      FieldName = 'quantity'
    end
    object memItenstotal: TCurrencyField
      FieldName = 'total'
    end
  end
end
