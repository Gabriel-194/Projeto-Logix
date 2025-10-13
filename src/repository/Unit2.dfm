object DataModule2: TDataModule2
  Height = 221
  Width = 585
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=logix'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 224
    Top = 38
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 102
    Top = 45
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabriel kuchma\Documents\Embarcadero\Studio\Projects\Pr' +
      'ojeto-Logix\lib\libpq.dll'
    Left = 333
    Top = 38
  end
end
