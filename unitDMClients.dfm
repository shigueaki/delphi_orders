object DMclients: TDMclients
  Height = 240
  Width = 253
  object tbClients: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = TConMinerva.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'tb_clients'
    Left = 45
    Top = 26
    object tbClientsid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tbClientsname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      Size = 100
    end
    object tbClientsaddress: TStringField
      FieldName = 'address'
      Origin = 'address'
      Size = 100
    end
    object tbClientsphone: TStringField
      FieldName = 'phone'
      Origin = 'phone'
    end
    object tbClientsemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object tbClientsactive: TBooleanField
      FieldName = 'active'
      Origin = 'active'
      Required = True
    end
  end
  object dsClients: TDataSource
    DataSet = tbClients
    Left = 45
    Top = 102
  end
end
