object TConMinerva: TTConMinerva
  OnCreate = DataModuleCreate
  Height = 294
  Width = 507
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=minerva'
      'User_Name=sa'
      'Password=Minerva2024'
      'SERVER=localhost\SQLExpress'
      'OSAuthent=No'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DELLG15'
      'MARS=yes'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    Left = 51
    Top = 26
  end
end
