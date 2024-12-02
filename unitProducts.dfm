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
  object Label1: TLabel
    Left = 32
    Top = 147
    Width = 32
    Height = 15
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 32
    Top = 323
    Width = 26
    Height = 15
    Caption = 'Price'
  end
  object Label3: TLabel
    Left = 32
    Top = 203
    Width = 60
    Height = 15
    Caption = 'Description'
  end
  object dbgRegisteredProducts: TDBGrid
    Left = 352
    Top = 75
    Width = 288
    Height = 305
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
  object DBEdit1: TDBEdit
    Left = 32
    Top = 168
    Width = 231
    Height = 23
    DataField = 'Name'
    DataSource = DMProducts.dsProduct
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 32
    Top = 224
    Width = 231
    Height = 89
    DataField = 'Description'
    DataSource = DMProducts.dsProduct
    TabOrder = 2
  end
  object DBCheckBox1: TDBCheckBox
    Left = 32
    Top = 384
    Width = 97
    Height = 17
    Caption = 'Allo Fractionate'
    DataField = 'AllowFractionate'
    DataSource = DMProducts.dsProduct
    TabOrder = 3
  end
  object DBCheckBox2: TDBCheckBox
    Left = 32
    Top = 424
    Width = 97
    Height = 17
    Caption = 'Active'
    DataField = 'Active'
    DataSource = DMProducts.dsProduct
    TabOrder = 4
  end
  object edtSearchClient: TEdit
    Left = 352
    Top = 40
    Width = 288
    Height = 23
    TabOrder = 5
    TextHint = 'Search product'
  end
  object DBEdit2: TDBEdit
    Left = 32
    Top = 344
    Width = 231
    Height = 23
    DataField = 'Price'
    DataSource = DMProducts.dsProduct
    TabOrder = 6
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 38
    Width = 290
    Height = 51
    DataSource = DMProducts.dsProduct
    TabOrder = 7
  end
end
