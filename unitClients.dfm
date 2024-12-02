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
  OnShow = FormShow
  TextHeight = 15
  object Label2: TLabel
    Left = 32
    Top = 152
    Width = 42
    Height = 15
    Caption = 'Address'
  end
  object Label3: TLabel
    Left = 32
    Top = 216
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
  object Label5: TLabel
    Left = 32
    Top = 88
    Width = 32
    Height = 15
    Caption = 'Name'
  end
  object Label1: TLabel
    Left = 32
    Top = 51
    Width = 14
    Height = 15
    Caption = 'ID:'
  end
  object lblId: TLabel
    Left = 64
    Top = 51
    Width = 18
    Height = 15
    Caption = '000'
  end
  object dbgRegisteredClients: TDBGrid
    Left = 296
    Top = 77
    Width = 320
    Height = 292
    DataSource = DMclients.dsClients
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
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
  object btnSave: TButton
    Left = 32
    Top = 392
    Width = 105
    Height = 50
    Caption = 'Save'
    TabOrder = 5
    OnClick = btnSaveClick
  end
  object btnNewClient: TButton
    Left = 511
    Top = 392
    Width = 105
    Height = 50
    Caption = 'New Client'
    TabOrder = 6
    OnClick = btnNewClientClick
  end
  object edtSearchClient: TEdit
    Left = 296
    Top = 48
    Width = 320
    Height = 23
    TabOrder = 7
    TextHint = 'Search client'
    OnChange = edtSearchClientChange
  end
  object edtmPhone: TMaskEdit
    Left = 32
    Top = 237
    Width = 227
    Height = 23
    EditMask = '!\(99\)0000-0000;1;_'
    MaxLength = 13
    TabOrder = 2
    Text = '(  )    -    '
  end
  object edtEmail: TEdit
    Left = 32
    Top = 301
    Width = 231
    Height = 23
    TabOrder = 3
    Text = 'edtEmail'
    OnKeyDown = edtEmailKeyDown
  end
  object edtAddress: TEdit
    Left = 32
    Top = 173
    Width = 231
    Height = 23
    TabOrder = 1
  end
  object edtName: TEdit
    Left = 32
    Top = 109
    Width = 231
    Height = 23
    TabOrder = 0
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
