object DMOrders: TDMOrders
  Height = 289
  Width = 434
  object qProducts: TFDQuery
    Active = True
    Connection = TConMinerva.FDConnection1
    SQL.Strings = (
      'SELECT * FROM tb_products'
      '')
    Left = 186
    Top = 51
    object qProductsId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qProductsName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 200
    end
    object qProductsDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 1000
    end
    object qProductsPrice: TFMTBCDField
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
      Precision = 18
      Size = 2
    end
    object qProductsAllowFractionate: TBooleanField
      FieldName = 'AllowFractionate'
      Origin = 'AllowFractionate'
      Required = True
    end
    object qProductsActive: TBooleanField
      FieldName = 'Active'
      Origin = 'Active'
      Required = True
    end
  end
  object dsProducts: TDataSource
    DataSet = qProducts
    Left = 184
    Top = 144
  end
  object qOrders: TFDQuery
    Connection = TConMinerva.FDConnection1
    SQL.Strings = (
      'select * from tb_orders')
    Left = 288
    Top = 48
    object qOrdersId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object dsOrders: TDataSource
    DataSet = qOrders
    Left = 296
    Top = 144
  end
end
