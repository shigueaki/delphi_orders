object DMProducts: TDMProducts
  Height = 207
  Width = 187
  object tbProduct: TFDTable
    Active = True
    IndexFieldNames = 'Id'
    Connection = TConMinerva.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'minerva.dbo.tb_products'
    Left = 51
    Top = 32
    object tbProductId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tbProductName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 200
    end
    object tbProductDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 1000
    end
    object tbProductPrice: TFMTBCDField
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
      Precision = 18
      Size = 2
    end
    object tbProductAllowFractionate: TBooleanField
      FieldName = 'AllowFractionate'
      Origin = 'AllowFractionate'
      Required = True
    end
    object tbProductActive: TBooleanField
      FieldName = 'Active'
      Origin = 'Active'
      Required = True
    end
  end
  object dsProduct: TDataSource
    DataSet = tbProduct
    Left = 51
    Top = 112
  end
end
