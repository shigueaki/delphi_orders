object TConMinerva: TTConMinerva
  OnCreate = DataModuleCreate
  Height = 367
  Width = 634
  PixelsPerInch = 120
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
    Connected = True
    Left = 64
    Top = 32
  end
end
