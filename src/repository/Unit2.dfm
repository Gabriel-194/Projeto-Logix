object DataModule2: TDataModule2
  Height = 156
  Width = 626
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=logix'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 280
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 128
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabriel kuchma\Documents\Embarcadero\Studio\Projects\Pr' +
      'ojeto-Logix\lib\libpq.dll'
    Left = 416
    Top = 48
  end
end
