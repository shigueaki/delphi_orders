object DMOrders: TDMOrders
  Height = 289
  Width = 434
  object qSearchProducts: TFDQuery
    Connection = TConMinerva.FDConnection1
    SQL.Strings = (
      'SELECT * FROM tb_products'
      '')
    Left = 186
    Top = 51
    object qSearchProductsId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qSearchProductsName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 200
    end
    object qSearchProductsDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 1000
    end
    object qSearchProductsPrice: TFMTBCDField
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
      Precision = 18
      Size = 2
    end
    object qSearchProductsAllowFractionate: TBooleanField
      FieldName = 'AllowFractionate'
      Origin = 'AllowFractionate'
      Required = True
    end
    object qSearchProductsActive: TBooleanField
      FieldName = 'Active'
      Origin = 'Active'
      Required = True
    end
  end
  object dsSearchProducts: TDataSource
    DataSet = qSearchProducts
    Left = 184
    Top = 144
  end
end
