object formProducts: TformProducts
  Left = 0
  Top = 0
  Caption = 'Products'
  ClientHeight = 528
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label3: TLabel
    Left = 32
    Top = 179
    Width = 60
    Height = 15
    Caption = 'Description'
  end
  object dbgRegisteredProducts: TDBGrid
    Left = 352
    Top = 75
    Width = 288
    Height = 342
    DataSource = DMProducts.dsProduct
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Registered Products'
        Width = 209
        Visible = True
      end>
  end
  object DBCheckBox1: TDBCheckBox
    Left = 32
    Top = 363
    Width = 97
    Height = 17
    Caption = 'Allo Fractionate'
    DataField = 'AllowFractionate'
    DataSource = DMProducts.dsProduct
    TabOrder = 1
  end
  object DBCheckBox2: TDBCheckBox
    Left = 32
    Top = 400
    Width = 97
    Height = 17
    Caption = 'Active'
    DataField = 'Active'
    DataSource = DMProducts.dsProduct
    TabOrder = 2
  end
  object edtSearchClient: TEdit
    Left = 352
    Top = 40
    Width = 288
    Height = 23
    TabOrder = 3
    TextHint = 'Search product'
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 38
    Width = 290
    Height = 51
    DataSource = DMProducts.dsProduct
    TabOrder = 4
  end
  object DBLabeledEdit1: TDBLabeledEdit
    Left = 32
    Top = 136
    Width = 231
    Height = 23
    DataField = 'Name'
    DataSource = DMProducts.dsProduct
    TabOrder = 5
    EditLabel.Width = 32
    EditLabel.Height = 15
  end
  object DBMemo1: TDBMemo
    Left = 32
    Top = 200
    Width = 231
    Height = 89
    DataField = 'Description'
    DataSource = DMProducts.dsProduct
    TabOrder = 6
  end
  object DBLabeledEdit2: TDBLabeledEdit
    Left = 32
    Top = 320
    Width = 231
    Height = 23
    DataField = 'Price'
    DataSource = DMProducts.dsProduct
    TabOrder = 7
    EditLabel.Width = 26
    EditLabel.Height = 15
  end
end
