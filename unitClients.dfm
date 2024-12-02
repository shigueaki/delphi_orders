object formClients: TformClients
  Left = 0
  Top = 0
  Caption = 'Clients'
  ClientHeight = 458
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 32
    Height = 15
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 32
    Top = 128
    Width = 42
    Height = 15
    Caption = 'Address'
  end
  object Label3: TLabel
    Left = 32
    Top = 200
    Width = 34
    Height = 15
    Caption = 'Phone'
  end
  object Label4: TLabel
    Left = 32
    Top = 280
    Width = 29
    Height = 15
    Caption = 'Email'
  end
  object dbgRegisteredClients: TDBGrid
    Left = 296
    Top = 77
    Width = 320
    Height = 292
    DataSource = DMclients.dsClients
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = dbgRegisteredClientsCellClick
    OnKeyDown = dbgRegisteredClientsKeyDown
    OnKeyUp = dbgRegisteredClientsKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Registered Clients'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 32
    Top = 392
    Width = 105
    Height = 50
    Caption = 'F7 - Salvar'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 511
    Top = 392
    Width = 105
    Height = 50
    Caption = 'F2 - Novo Cliente'
    TabOrder = 2
  end
  object edtSearchClient: TEdit
    Left = 296
    Top = 48
    Width = 320
    Height = 23
    TabOrder = 3
    TextHint = 'Search client'
    OnChange = edtSearchClientChange
  end
  object edtmPhone: TMaskEdit
    Left = 32
    Top = 221
    Width = 231
    Height = 23
    EditMask = '!\(99\)000-0000;1;_'
    MaxLength = 12
    TabOrder = 4
    Text = '(  )   -    '
  end
  object edtEmail: TEdit
    Left = 32
    Top = 301
    Width = 231
    Height = 23
    TabOrder = 5
    Text = 'edtEmail'
  end
  object edtAddress: TEdit
    Left = 32
    Top = 149
    Width = 231
    Height = 23
    TabOrder = 6
  end
  object edtName: TEdit
    Left = 32
    Top = 77
    Width = 231
    Height = 23
    TabOrder = 7
  end
  object chkActive: TCheckBox
    Left = 32
    Top = 352
    Width = 97
    Height = 17
    Caption = 'Active'
    TabOrder = 8
  end
end
